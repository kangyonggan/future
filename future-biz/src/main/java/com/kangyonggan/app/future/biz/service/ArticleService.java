package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Article;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/21/17
 */
public interface ArticleService {

    /**
     * 搜索文章
     *
     * @param pageNum
     * @param username
     * @param categoryCode
     * @param status
     * @param title
     * @return
     */
    List<Article> searchArticles(int pageNum, String username, String categoryCode, String status, String title);

    /**
     * 查找文章
     *
     * @param id
     * @return
     */
    Article findArticleById(Long id);

    /**
     * 更新文章
     *
     * @param article
     */
    void updateArticle(Article article);

    /**
     * 物理删除文章
     *
     * @param id
     */
    void deleteArticleById(Long id);
}
