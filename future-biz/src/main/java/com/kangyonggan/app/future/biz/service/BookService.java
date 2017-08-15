package com.kangyonggan.app.future.biz.service;

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
     * 站内搜索url
     */
    String ZHAN_NEI_URL = "http://zhannei.baidu.com/cse/search?q=&s=11522483553330821378&nsid=&p=";

    /**
     * 更新书籍根据站内搜索
     */
    void updateBooksBySearch();

    /**
     * 更新书籍根据书籍代码
     */
    void updateBooksByCode();

}
