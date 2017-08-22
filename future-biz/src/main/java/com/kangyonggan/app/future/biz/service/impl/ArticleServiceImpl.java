package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.ArticleService;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Article;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/21/17
 */
@Service
public class ArticleServiceImpl extends BaseService<Article> implements ArticleService {

    @Override
    @LogTime
    public List<Article> searchArticles(int pageNum, String username, String categoryCode, String status, String title) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        if (StringUtils.isNotEmpty(username)) {
            criteria.andEqualTo("username", username);
        }
        if (StringUtils.isNotEmpty(categoryCode)) {
            criteria.andEqualTo("categoryCode", categoryCode);
        }
        if (StringUtils.isNotEmpty(title)) {
            criteria.andEqualTo("title", title);
        }
        if (StringUtils.isNotEmpty(status)) {
            criteria.andEqualTo("status", status);
        }

        example.selectProperties("id", "username", "title", "categoryCode", "categoryName", "isDeleted", "status", "createdTime", "updatedTime");
        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public Article findArticleById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @LogTime
    public void updateArticle(Article article) {
        myMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    @LogTime
    public void deleteArticleById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }

    @Override
    @LogTime
    public void saveArticle(Article article) {
        myMapper.insertSelective(article);
    }

    @Override
    @LogTime
    public Article findPrevArticle(Long id, String username) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andLessThan("id", id);
        if (StringUtils.isNotEmpty(username)) {
            criteria.andEqualTo("username", username);
        }

        example.setOrderByClause("id desc");

        PageHelper.startPage(1, 1);
        List<Article> articles = myMapper.selectByExample(example);

        return articles.isEmpty() ? null : articles.get(0);
    }

    @Override
    @LogTime
    public Article findNextArticle(Long id, String username) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andGreaterThan("id", id);
        if (StringUtils.isNotEmpty(username)) {
            criteria.andEqualTo("username", username);
        }

        example.setOrderByClause("id asc");

        PageHelper.startPage(1, 1);
        List<Article> articles = myMapper.selectByExample(example);

        return articles.isEmpty() ? null : articles.get(0);
    }
}
