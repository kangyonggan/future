package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.biz.service.RedisService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.FileUtil;
import com.kangyonggan.app.future.common.util.HtmlUtil;
import com.kangyonggan.app.future.mapper.BookMapper;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.extra.core.annotation.Cache;
import com.kangyonggan.extra.core.annotation.CacheDel;
import com.kangyonggan.extra.core.annotation.Log;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
@Service
@Log4j2
public class BookServiceImpl extends BaseService<Book> implements BookService {

    private static final String BOOK_UPDATE_FLAG = "book:update:flag";

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RedisService redisService;

    private boolean isUpdatedFinished = true;

    private String prefix = PropertiesUtil.getProperties("redis.prefix") + ":";

    @PostConstruct
    public void init() {
        redisService.delete(prefix + BOOK_UPDATE_FLAG);
        log.info("小说更新标识已重置");
    }

    @Override
    @Log
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public boolean updateBooksByCode(final int code) {
        Object flag = redisService.get(prefix + BOOK_UPDATE_FLAG);

        if (flag != null) {
            log.info("小说已经正在更新中,此处更新终止");
            return false;
        }

        redisService.set(prefix + BOOK_UPDATE_FLAG, "1");

        new Thread() {
            @Override
            public void run() {
                int c = code;
                while (c <= 19293) {
                    try {
                        parseBookInfo(BI_QU_GE_URL + "book/" + c++);
                    } catch (Exception e) {
                        log.warn("抓取小说异常,code=" + (c - 1), e);
                    }
                }

                redisService.delete(prefix + BOOK_UPDATE_FLAG);
            }
        }.start();

        return true;
    }

    @Override
    @Log
    public List<Book> searchBooks(int pageNum, String bookCode, String bookName, String author, String categoryCode, String isFinished, String isHot, String isAutoUpdate) {
        Example example = new Example(Book.class);
        Example.Criteria criteria = example.createCriteria();

        if (StringUtils.isNotEmpty(bookCode)) {
            criteria.andEqualTo("code", bookCode);
        }
        if (StringUtils.isNotEmpty(bookName)) {
            criteria.andEqualTo("name", bookName);
        }
        if (StringUtils.isNotEmpty(author)) {
            criteria.andEqualTo("author", author);
        }
        if (StringUtils.isNotEmpty(categoryCode)) {
            criteria.andEqualTo("categoryCode", categoryCode);
        }
        if (StringUtils.isNotEmpty(isFinished)) {
            criteria.andEqualTo("isFinished", isFinished);
        }
        if (StringUtils.isNotEmpty(isHot)) {
            criteria.andEqualTo("isHot", isHot);
        }
        if (StringUtils.isNotEmpty(isAutoUpdate)) {
            criteria.andEqualTo("isAutoUpdate", isAutoUpdate);
        }

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    @Cache(key = "book:code:${code}")
    public Book findBookByCode(int code) {
        Book book = new Book();
        book.setCode(code);

        return myMapper.selectOne(book);
    }

    @Override
    @Log
    @CacheDel(key = "book:code:${book.code}")
    public void updateBook(Book book) {
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("code", book.getCode());

        myMapper.updateByExampleSelective(book, example);
    }

    @Override
    @Log
    public Book findLastBook() {
        Example example = new Example(Book.class);
        example.setOrderByClause("code desc");

        PageHelper.startPage(1, 1);
        List<Book> books = myMapper.selectByExample(example);

        return books.isEmpty() ? null : books.get(0);
    }

    @Override
    @Log
    public List<Category> findAllCategoryWithBookCount() {
        return bookMapper.selectAllCategoryWithBookCount();
    }

    @Override
    @Log
    public List<Book> findHotBooks(int pageNum, int pageSize) {
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("isHot", 1);

        example.setOrderByClause("updated_time desc");

        PageHelper.startPage(pageNum, pageSize);
        return myMapper.selectByExample(example);
    }

    @Override
    public void updateBookNewSection(int bookCode, int sectionCode, String title) {
        Book book = new Book();
        book.setNewSectionCode(sectionCode);
        book.setNewSectionTitle(title);

        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("code", bookCode);

        myMapper.updateByExampleSelective(book, example);
    }

    @Override
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public void updateBookIsFinished() {
        if (!isUpdatedFinished) {
            return;
        }

        isUpdatedFinished = false;
        Book book = findLastBook();
        if (book == null) {
            return;
        }

        for (int i = 1; i <= book.getCode(); i++) {
            try {
                if (existBook(i + "")) {
                    String url = BI_QU_GE_URL + "book/" + i;
                    Document bookDoc = HtmlUtil.parseUrl(url);
                    boolean isFinished = !bookDoc.select("#maininfo #info p").get(1).html().trim().contains("连载");
                    if (isFinished) {
                        book.setIsFinished((byte) 1);
                        myMapper.updateByPrimaryKeySelective(book);
                    }
                }
            } catch (Exception e) {
                log.warn("更新小说是否完结异常", e);
            }
        }
        isUpdatedFinished = true;
    }

    @Override
    @Log
    public List<Book> searchBooks(String key) {
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("name", key);
        example.or(example.createCriteria().andEqualTo("author", key));

        example.setOrderByClause("id desc");

        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public List<Book> findBooksByCategoryCode(int pageNum, String code) {
        Example example = new Example(Book.class);
        example.createCriteria().andEqualTo("categoryCode", code);
        example.setOrderByClause("code desc");

        PageHelper.startPage(pageNum, 50);
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public List<Book> findAutoUpdateBooks() {
        Book book = new Book();
        book.setIsAutoUpdate((byte) 1);

        return myMapper.select(book);
    }

    /**
     * 解析小说详情
     *
     * @param bookUrl
     * @throws Exception
     */
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public void parseBookInfo(String bookUrl) throws Exception {
        Document bookDoc = HtmlUtil.parseUrl(bookUrl);

        String code = bookUrl.substring(bookUrl.indexOf("book") + 5, bookUrl.length());

        // 判断库中是否已存在
        if (existBook(code)) {
            log.info("小说{}已存在", code);
            return;
        }

        String name = bookDoc.select("#maininfo #info h1").html().trim();
        String author = bookDoc.select("#maininfo #info p").get(0).html().trim();
        String categoryCode = bookDoc.select(".box_con .con_top a").get(1).attr("href").replaceAll("/", "");

        Category category = categoryService.findCategoryByTypeAndCode(CategoryType.BOOK.getType(), categoryCode);
        if (category == null) {
            category = categoryService.findCategoryByTypeAndCode(CategoryType.BOOK.getType(), "qita");
        }

        String picUrl = bookDoc.select("#fmimg img").attr("src");
        author = author.substring(author.indexOf("：") + 1);
        String descp = bookDoc.select("#intro p").get(0).html().trim();
        boolean isFinished = !bookDoc.select("#maininfo #info p").get(1).html().trim().contains("连载");

        Book book = new Book();
        book.setCode(Integer.parseInt(code));
        book.setName(name);
        book.setAuthor(author);
        book.setDescp(descp);
        book.setCategoryCode(categoryCode);
        book.setCategoryName(category.getName());
        book.setIsFinished((byte) (isFinished ? 1 : 0));

        String filePath = "cover/" + code + picUrl.substring(picUrl.lastIndexOf("."));
        try {
            FileUtil.downloadFromUrl(picUrl, PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + filePath);
        } catch (Exception e) {
            filePath = "cover/nocover.jpg";
        }
        book.setPicUrl(filePath);

        log.info("抓取小说{}", book);
        saveBook(book);
    }

    /**
     * 判断小说是否存在
     *
     * @param code
     * @return
     */
    private boolean existBook(String code) {
        Book book = new Book();
        book.setCode(Integer.parseInt(code));

        return super.exists(book);
    }

    /**
     * 保存小说
     *
     * @param book
     */
    private void saveBook(Book book) {
        myMapper.insertSelective(book);
    }
}
