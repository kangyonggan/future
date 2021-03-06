package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
public interface BookService {

    /**
     * 笔趣阁地址
     */
    String BI_QU_GE_URL = "http://www.biquge.cn/";

    /**
     * 更新小说根据小说代码
     *
     * @param code
     * @return
     */
    boolean updateBooksByCode(final int code);

    /**
     * 按条件搜索小说
     *
     * @param pageNum
     * @param bookCode
     * @param bookName
     * @param author
     * @param categoryCode
     * @param isFinished
     * @param isHot
     * @param isAutoUpdate
     * @return
     */
    List<Book> searchBooks(int pageNum, String bookCode, String bookName, String author, String categoryCode, String isFinished, String isHot, String isAutoUpdate);

    /**
     * 查找小说
     *
     * @param code
     * @return
     */
    Book findBookByCode(int code);

    /**
     * 更新小说
     *
     * @param book
     */
    void updateBook(Book book);

    /**
     * 查找最后抓取的书籍
     *
     * @return
     */
    Book findLastBook();

    /**
     * 查找所有分类，带有小说总数
     *
     * @return
     */
    List<Category> findAllCategoryWithBookCount();

    /**
     * 查找推荐小说
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Book> findHotBooks(int pageNum, int pageSize);

    /**
     * 更新小说最新章节
     *
     * @param bookCode
     * @param sectionCode
     * @param title
     */
    void updateBookNewSection(int bookCode, int sectionCode, String title);

    /**
     * 更新小说是否完结
     */
    void updateBookIsFinished();

    /**
     * 搜索小说
     *
     * @param key
     * @return
     */
    List<Book> searchBooks(String key);

    /**
     * 查找某分类的小说
     *
     * @param pageNum
     * @param code
     * @return
     */
    List<Book> findBooksByCategoryCode(int pageNum, String code);

    /**
     * 查找自动更新的小说
     *
     * @return
     */
    List<Book> findAutoUpdateBooks();

}
