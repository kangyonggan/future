package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.News;

/**
 * @author kangyonggan
 * @since 8/31/17
 */
public interface NewsService {

    /**
     * 保存新闻
     *
     * @param news
     */
    void saveNews(News news);

    /**
     * 更新新闻
     *
     * @param news
     */
    void updateNews(News news);
}
