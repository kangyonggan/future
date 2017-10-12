package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.ArticleService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.DateUtil;
import com.kangyonggan.app.future.common.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.vo.Article;
import com.kangyonggan.app.future.model.vo.User;
import com.kangyonggan.methodlogger.MethodLogger;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Date;
import java.util.List;

/**
 * @author kangyonggan
 * @since 8/21/17
 */
@Service
@Log4j2
public class ArticleServiceImpl extends BaseService<Article> implements ArticleService {

    @Autowired
    private UserService userService;

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
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
    public List<Article> searchArticles(int pageNum, String categoryCode, String key) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andEqualTo("status", ArticleStatus.COMPLETE.getStatus());
        criteria.andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);

        if (StringUtils.isNotEmpty(categoryCode)) {
            criteria.andEqualTo("categoryCode", categoryCode);
        }

        if (StringUtils.isNotEmpty(key)) {
            criteria.andLike("title", StringUtil.toLikeString(key));
            example.or(example.createCriteria().andLike("categoryName", StringUtil.toLikeString(key)));
        }

        example.selectProperties("id", "username", "title", "categoryCode", "categoryName", "isDeleted", "content", "status", "createdTime", "updatedTime");
        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE / 2);
        List<Article> articles = myMapper.selectByExample(example);

        processSummary(articles);

        processQueryKey(articles, key);

        return articles;
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
    public Article findPrevArticle(Long id) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andLessThan("id", id);
        criteria.andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);
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

    @Override
    @LogTime
    public Article findNextArticle(Long id) {
        Example example = new Example(Article.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andGreaterThan("id", id);
        criteria.andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);
        example.setOrderByClause("id asc");

        PageHelper.startPage(1, 1);
        List<Article> articles = myMapper.selectByExample(example);

        return articles.isEmpty() ? null : articles.get(0);
    }

    @Override
    @LogTime
    public Article findActiveArticleById(Long id) {
        Article article = new Article();
        article.setId(id);
        article.setIsDeleted(AppConstants.IS_DELETED_NO);
        article.setStatus(ArticleStatus.COMPLETE.getStatus());

        return myMapper.selectOne(article);
    }

    @Override
    @LogTime
    public void genBlogRss(String username) {
        Example example = new Example(Article.class);
        example.createCriteria().andEqualTo("username", username)
                .andEqualTo("status", ArticleStatus.COMPLETE.getStatus())
                .andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);
        example.setOrderByClause("id desc");

        User user = userService.findUserByUsername(username);

        genRssFile(myMapper.selectByExample(example), user);
    }

    /**
     * 处理摘要，就是截取<!-- more -->之前的,顺便把md转为html
     *
     * @param articles
     * @return
     */
    private void processSummary(List<Article> articles) {
        for (Article article : articles) {
            String content = article.getContent();
            int index = content.indexOf("<!-- more -->");
            if (index > -1) {
                article.setContent(MarkdownUtil.markdownToHtml(content.substring(0, index)));
            } else {
                article.setContent(MarkdownUtil.markdownToHtml(content));
            }
        }
    }

    /**
     * 关键字标记为红色，目前只处理标题
     *
     * @param articles
     * @param question
     */
    private void processQueryKey(List<Article> articles, String question) {
        String replacement = "<span class='red'>" + question + "</span>";
        for (Article article : articles) {
            article.setTitle(article.getTitle().replaceAll("(?i)" + question, replacement));
        }
    }

    /**
     * 生成rss文件
     *
     * @param articles
     * @param user
     */
    private void genRssFile(List<Article> articles, User user) {
        StringBuilder rss = new StringBuilder("<feed xmlns=\"http://www.w3.org/2005/Atom\"><title>");
        rss.append(PropertiesUtil.getProperties("app.name")).append("</title>");
        rss.append("<link href=\"/rss/blog-" + user.getUsername() + ".xml\" rel=\"self\"/>").append("<link href=\"https://www.kangyonggan.com/\"/>");
        rss.append("<updated>").append(DateUtil.toXmlDateTime(new Date())).append("</updated>");
        rss.append("<id>https://www.kangyonggan.com/</id>");
        rss.append("<author><name>").append(user.getRealname()).append("</name></author>");

        for (Article article : articles) {
            rss.append("<entry><title>").append(article.getTitle()).append("</title>");
            rss.append("<link href=\"https://www.kangyonggan.com/#article/").append(article.getId()).append("\"/>");
            rss.append("<id>https://www.kangyonggan.com/#article/").append(article.getId()).append("</id>");
            rss.append("<published>").append(DateUtil.toXmlDateTime(article.getCreatedTime())).append("</published>");
            rss.append("<updated>").append(DateUtil.toXmlDateTime(article.getUpdatedTime())).append("</updated>");
            rss.append("<content type=\"html\"><![CDATA[").append(MarkdownUtil.markdownToHtml(article.getContent())).append("]]></content>");

            int index = article.getContent().indexOf("<!-- more -->");
            if (index > -1) {
                String summary = article.getContent().substring(0, index);
                rss.append("<summary type=\"html\"><![CDATA[").append(MarkdownUtil.markdownToHtml(summary)).append("]]></summary>");
            } else {
                rss.append("<summary type=\"html\"><![CDATA[").append(MarkdownUtil.markdownToHtml(article.getContent())).append("]]></summary>");
            }

            rss.append("<category term=\"").append(article.getCategoryName()).append("\" scheme=\"https://www.kangyonggan.com/#category/").append(article.getCategoryCode()).append("/\"/>");
            rss.append("</entry>");
        }

        rss.append("</feed>");

        File file = new File(PropertiesUtil.getProperties("file.root.path") + "rss/blog-" + user.getUsername() + ".xml");

        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }

        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(file));
            writer.write(rss.toString());
            writer.flush();
        } catch (Exception e) {
            log.error("生成博客rss异常, 文件路径：" + PropertiesUtil.getProperties("file.root.path") + "rss/blog-" + user.getUsername() + ".xml", e);
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (Exception e) {
                    log.error("写rss后关闭输入流异常", e);
                }
            }
        }
    }
}
