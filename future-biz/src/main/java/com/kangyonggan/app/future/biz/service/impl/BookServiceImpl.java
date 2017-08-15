package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.FileUtil;
import com.kangyonggan.app.future.common.util.HtmlUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
@Service
@Log4j2
public class BookServiceImpl extends BaseService<Book> implements BookService {

    @Autowired
    private CategoryService categoryService;

    @Override
    @LogTime
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public void updateBooksByCode() {
        int code = 1;
        while (true) {
            try {
                parseBookInfo(BI_QU_GE_URL + "book/" + code++);
            } catch (Exception e) {
                log.warn("抓取书籍异常,code=" + (code - 1), e);
            }
        }
    }

    @Override
    @LogTime
    public List<Book> searchBooks(int pageNum, String bookCode, String bookName, String author, String categoryCode, Byte isFinished, Byte isHot) {
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
        if (isFinished != null) {
            criteria.andEqualTo("isFinished", isFinished);
        }
        if (isHot != null) {
            criteria.andEqualTo("isHot", isHot);
        }

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    /**
     * 解析书籍详情
     *
     * @param bookUrl
     * @throws Exception
     */
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    private void parseBookInfo(String bookUrl) throws Exception {
        Document bookDoc = HtmlUtil.parseUrl(bookUrl);

        String code = bookUrl.substring(bookUrl.indexOf("book") + 5, bookUrl.length());

        // 判断库中是否已存在
        if (existBook(code)) {
            log.info("书籍{}已存在", code);
            return;
        }

        String name = bookDoc.select("#maininfo #info h1").html().trim();
        String author = bookDoc.select("#maininfo #info p").get(0).html().trim();
        String categoryCode = bookDoc.select(".box_con .con_top a").get(1).attr("href").replaceAll("/", "");

        Category category = categoryService.findCategoryByTypeAndCode(CategoryType.BOOK.getType(), categoryCode);

        String picUrl = bookDoc.select("#fmimg img").attr("src");
        author = author.substring(author.indexOf("：") + 1);
        String descp = bookDoc.select("#intro p").get(0).html().trim();
        boolean isFinished = bookDoc.select("#maininfo #info p").get(1).html().trim().contains("连载");

        Book book = new Book();
        book.setCode(Integer.parseInt(code));
        book.setName(name);
        book.setAuthor(author);
        book.setDescp(descp);
        book.setCategoryCode(categoryCode);
        book.setCategoryName(category.getName());
        book.setIsFinished((byte) (isFinished ? 1 : 0));

        String filePath = "cover/" + code + picUrl.substring(picUrl.lastIndexOf("."));
        FileUtil.downloadFromUrl(picUrl, PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + filePath);
        book.setPicUrl(filePath);

        log.info("抓取书籍{}", book);
        saveBook(book);
    }

    /**
     * 判断书籍是否存在
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
     * 保存书籍
     *
     * @param book
     */
    private void saveBook(Book book) {
        myMapper.insertSelective(book);
    }
}
