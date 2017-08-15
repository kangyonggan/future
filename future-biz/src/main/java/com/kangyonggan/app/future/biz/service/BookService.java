package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Book;

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
     * 更新书籍根据书籍代码
     */
    void updateBooksByCode();

    /**
     * 按条件搜索书籍
     *
     * @param pageNum
     * @param bookCode
     * @param bookName
     * @param author
     * @param categoryCode
     * @param isFinished
     * @param isHot
     * @return
     */
    List<Book> searchBooks(int pageNum, String bookCode, String bookName, String author, String categoryCode, Byte isFinished, Byte isHot);

}
