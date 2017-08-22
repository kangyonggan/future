package com.kangyonggan.app.future.web.controller.web;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.ArticleService;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.model.vo.Article;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author kangyonggan
 * @since 2016/12/22
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

    @Autowired
    private ArticleService articleService;

    /**
     * 网站模板
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String layout() {
        return "web/web-layout";
    }

    /**
     * 网站首页
     *
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum, Model model) {
        List<Article> articles = articleService.searchArticles(pageNum, null, null);
        PageInfo<Article> page = new PageInfo(articles);

        model.addAttribute("page", page);
        model.addAttribute("type", "index");
        return getPathIndex();
    }

    /**
     * 搜索
     *
     * @param key
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "key") String key,
                         @RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                         Model model) {
        List<Article> articles = articleService.searchArticles(pageNum, null, key);
        PageInfo<Article> page = new PageInfo(articles);

        model.addAttribute("page", page);
        model.addAttribute("type", "search");
        return getPathIndex();
    }

    /**
     * 按栏目查看文章列表
     *
     * @param code
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(value = "category/{code:[\\w]+}", method = RequestMethod.GET)
    public String category(@PathVariable("code") String code, @RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                           Model model) {
        List<Article> articles = articleService.searchArticles(pageNum, code, null);
        PageInfo<Article> page = new PageInfo(articles);

        model.addAttribute("page", page);
        model.addAttribute("type", "category/" + code);
        return getPathIndex();
    }

    /**
     * 文章详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "article/{id:[\\d]+}", method = RequestMethod.GET)
    public String search(@PathVariable("id") Long id, Model model) {
        Article article = articleService.findActiveArticleById(id);

        article.setContent(MarkdownUtil.markdownToHtml(article.getContent()));

        model.addAttribute("article", article);
        return getPathRoot() + "/detail";
    }

}
