package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.RedisService;
import com.kangyonggan.app.future.biz.service.SectionService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.HtmlUtil;
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
public class SectionServiceImpl extends BaseService<Section> implements SectionService {

    private static final String SECTION_UPDATE_FLAG = "section:update:flag";

    @Autowired
    private BookService bookService;

    @Autowired
    private RedisService redisService;

    private String prefix = PropertiesUtil.getProperties("redis.prefix") + ":";

    @PostConstruct
    public void init() {
        redisService.delete(prefix + SECTION_UPDATE_FLAG);
        log.info("小说章节更新标识已重置");
    }

    @Override
    @LogTime
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public boolean updateBookSections(int code) {
        Book book = bookService.findBookByCode(code);
        if (book.getIsFinished() == 1) {
            log.info("小说已完结，无需更新");
            // 小时状态置为完结
            book.setIsFinished((byte) 1);
            bookService.updateBook(book);
            return false;
        }

        Object flag = redisService.get(prefix + SECTION_UPDATE_FLAG);

        if (flag != null) {
            log.info("其他小说正在更新, 此处更新终止");
            return false;
        }
        redisService.set(prefix + SECTION_UPDATE_FLAG, "1");

        Section lastSection = findLastSectionByBookCode(code);

        new Thread() {
            @Override
            public void run() {
                try {
                    Document bookDoc = HtmlUtil.parseUrl(BookService.BI_QU_GE_URL + "book/" + code);
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
                        parseSection(book, Integer.parseInt(scode));
                    }
                } catch (Exception e) {
                    log.warn("抓取章节异常", e);
                } finally {
                    redisService.delete(prefix + SECTION_UPDATE_FLAG);
                }

                // 把最新章节更新到小说表中
                Section lastNewSection = findLastSectionByBookCode(code);
                if (lastNewSection != null) {
                    bookService.updateBookNewSection(code, lastNewSection.getCode(), lastNewSection.getTitle());
                }
            }
        }.start();

        return true;
    }

    /**
     * 解析章节
     *
     * @param book
     * @param sectionCode
     */
    private void parseSection(Book book, int sectionCode) {
        Document doc = HtmlUtil.parseUrl(BookService.BI_QU_GE_URL + "/book/" + book.getCode() + "/" + sectionCode + ".html");

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
        section.setBookCode(book.getCode());
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
    private Section findLastSectionByBookCode(int bookCode) {
        Example example = new Example(Section.class);
        example.createCriteria().andEqualTo("bookCode", bookCode);
        example.setOrderByClause("code desc");

        PageHelper.startPage(1, 1);
        List<Section> sections = myMapper.selectByExample(example);
        return sections.isEmpty() ? null : sections.get(0);
    }
}
