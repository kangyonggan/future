package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.RedisService;
import com.kangyonggan.app.future.biz.service.SectionService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.HtmlUtil;
import com.kangyonggan.app.future.model.annotation.CacheGetOrSave;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Section;
import lombok.extern.log4j.Log4j2;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/8/15 0015
 */
@Service
@Log4j2
@Transactional(propagation = Propagation.NOT_SUPPORTED)
public class SectionServiceImpl extends BaseService<Section> implements SectionService {

    private static final String SECTION_UPDATE_FLAG = "section:update:flag";

    @Autowired
    private BookService bookService;

    @Autowired
    private RedisService redisService;

    private String prefix = PropertiesUtil.getProperties("redis.prefix") + ":";

    private boolean isUpdated;

    @PostConstruct
    public void init() {
        redisService.delete(prefix + SECTION_UPDATE_FLAG);
        log.info("小说章节更新标识已重置");
    }

    @Override
    @LogTime
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public boolean updateBookSections(int code) {
        Object flag = redisService.get(prefix + SECTION_UPDATE_FLAG);

        if (flag != null) {
            log.info("其他小说正在更新, 此处更新终止");
            return false;
        }
        redisService.set(prefix + SECTION_UPDATE_FLAG, "1");

        new Thread() {
            @Override
            public void run() {
                try {
                    updateSections(code);
                } catch (Exception e) {
                    log.warn("更新小说章节异常", e);
                }
                redisService.delete(prefix + SECTION_UPDATE_FLAG);
            }
        }.start();

        return true;
    }

    @Override
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public void updateSections() {
        if (isUpdated) {
            log.info("小说正在更新");
            return;
        }

        isUpdated = true;
        List<Book> books = bookService.findAutoUpdateBooks();

        for (int i = 0; i < books.size(); i++) {
            try {
                updateSections(books.get(i).getCode());
            } catch (Exception e) {
                log.warn("更新小说章节异常", e);
            }
        }
        isUpdated = false;
    }

    /**
     * 更新小说章节
     *
     * @param bookCode
     */
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    private void updateSections(int bookCode) {
        Book book = bookService.findBookByCode(bookCode);

        if (book == null) {
            return;
        }

        if (book.getIsFinished() == 1) {
            log.info("小说已完结，无需更新");
            // 小时状态置为完结
            book.setIsFinished((byte) 1);
            bookService.updateBook(book);
            return;
        }

        try {
            Section lastSection = findLastSectionByBookCode(bookCode);

            if (lastSection != null && lastSection.getCode() == book.getNewSectionCode()) {
                log.info("此小说已经更新到最新章节了");
                return;
            }
            Document bookDoc = HtmlUtil.parseUrl(BookService.BI_QU_GE_URL + "book/" + bookCode);
            Elements elements = bookDoc.select("#list dl dd a");

            int startNum = 0;
            for (int i = 0; i < elements.size(); i++) {
                Element element = elements.get(i);
                String scode = element.attr("href");
                scode = scode.substring(scode.lastIndexOf("/") + 1, scode.lastIndexOf("."));
                if (lastSection == null || lastSection.getCode() == Integer.parseInt(scode)) {
                    startNum = i;
                    break;
                }
            }

            log.info("从第{}章节开始更新", startNum);
            for (int i = startNum; i < elements.size(); i++) {
                Element element = elements.get(i);
                String scode = element.attr("href");
                scode = scode.substring(scode.lastIndexOf("/") + 1, scode.lastIndexOf("."));
                parseSection(bookCode, Integer.parseInt(scode));

                // 把上一章的"下一章节代码"更新一下
                if (i == startNum + 1) {
                    Element elementPrev = elements.get(i - 1);
                    String scodePrev = elementPrev.attr("href");
                    scodePrev = scodePrev.substring(scodePrev.lastIndexOf("/") + 1, scodePrev.lastIndexOf("."));

                    Section section = new Section();
                    section.setCode(Integer.parseInt(scodePrev));
                    section.setNextSectionCode(Integer.parseInt(scode));

                    updateSectionByCode(section);
                }
            }
        } catch (Exception e) {
            log.warn("抓取章节异常", e);
            return;
        }

        // 把最新章节更新到小说表中
        try {
            Section lastNewSection = findLastSectionByBookCode(bookCode);
            if (lastNewSection != null) {
                bookService.updateBookNewSection(bookCode, lastNewSection.getCode(), lastNewSection.getTitle());
            }
        } catch (Exception e) {
            log.warn("查找最后的章节异常", e);
        }
    }

    /**
     * 根据章节代码更新章节
     *
     * @param section
     */
    private void updateSectionByCode(Section section) {
        Example example = new Example(Section.class);
        example.createCriteria().andEqualTo("code", section.getCode());

        myMapper.updateByExampleSelective(section, example);
    }

    @Override
    public List<Section> findBookSections(int code) {
        Example example = new Example(Section.class);
        example.createCriteria().andEqualTo("bookCode", code);
        example.selectProperties("code", "title");

        example.setOrderByClause("code asc");
        return myMapper.selectByExample(example);
    }

    /**
     * 解析章节
     *
     * @param bookCode
     * @param sectionCode
     */
    private void parseSection(int bookCode, int sectionCode) {
        Document doc = HtmlUtil.parseUrl(BookService.BI_QU_GE_URL + "/book/" + bookCode + "/" + sectionCode + ".html");

        Section s = new Section();
        s.setCode(sectionCode);
        if (super.exists(s)) {
            log.info("章节已存在, code={}", sectionCode);
            return;
        }

        String title = doc.select(".bookname h1").html().trim();
        String content = doc.select("#content").html();
        String prevCode = doc.select(".bookname .bottem1 a").get(0).attr("href");
        if (!prevCode.endsWith("html")) {
            prevCode = "0";
        } else {
            prevCode = prevCode.substring(prevCode.lastIndexOf("/") + 1, prevCode.length() - 5);
        }

        String nextCode = doc.select(".bookname .bottem1 a").get(2).attr("href");
        if (!nextCode.endsWith("html")) {
            nextCode = "0";
        } else {
            nextCode = nextCode.substring(nextCode.lastIndexOf("/") + 1, nextCode.length() - 5);
        }

        Section section = new Section();
        section.setBookCode(bookCode);
        section.setCode(sectionCode);
        section.setTitle(title);
        section.setContent(content);

        section.setPrevSectionCode(Integer.parseInt(prevCode));
        section.setNextSectionCode(Integer.parseInt(nextCode));

        log.info("章节【{}】保存成功", section.getTitle());
        myMapper.insertSelective(section);
    }

    /**
     * 查找书籍最新章节
     *
     * @param bookCode
     * @return
     */
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public Section findLastSectionByBookCode(int bookCode) {
        Example example = new Example(Section.class);
        example.createCriteria().andEqualTo("bookCode", bookCode);
        example.setOrderByClause("code desc");

        PageHelper.startPage(1, 1);
        List<Section> sections = myMapper.selectByExample(example);
        return sections.isEmpty() ? null : sections.get(0);
    }

    @Override
    @LogTime
    @CacheGetOrSave("section:code:{0}")
    public Section findSectionByCode(int code) {
        Section section = new Section();
        section.setCode(code);

        return myMapper.selectOne(section);
    }

    @Override
    @LogTime
    public List<Section> findBookSections(int code, int pageNum) {
        Example example = new Example(Section.class);
        example.createCriteria().andEqualTo("bookCode", code);
        example.selectProperties("code", "title", "prevSectionCode", "nextSectionCode");

        example.setOrderByClause("code asc");

        PageHelper.startPage(pageNum, 100);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public Section findBookFirstSection(int bookCode) {
        Example example = new Example(Section.class);

        example.createCriteria().andEqualTo("bookCode", bookCode);

        example.setOrderByClause("code asc");
        PageHelper.startPage(1, 1);
        List<Section> sections = myMapper.selectByExample(example);

        return sections.isEmpty() ? null : sections.get(0);
    }

    @Override
    public List<Section> findNext100Sections(Integer bookCode, Integer code) {
        Example example = new Example(Section.class);
        example.createCriteria().andEqualTo("bookCode", bookCode).andGreaterThanOrEqualTo("code", code);

        example.setOrderByClause("code asc");

        PageHelper.startPage(1, 100);
        return myMapper.selectByExample(example);
    }
}
