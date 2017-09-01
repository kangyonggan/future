package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.ArticleService;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Article;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 8/21/17
 */
@Controller
@RequestMapping("dashboard/user/review")
public class DashboardUserReviewController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 文章审核
     *
     * @param pageNum
     * @param username
     * @param categoryCode
     * @param status
     * @param title
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "username", required = false, defaultValue = "") String username,
                       @RequestParam(value = "categoryCode", required = false, defaultValue = "") String categoryCode,
                       @RequestParam(value = "status", required = false, defaultValue = "") String status,
                       @RequestParam(value = "title", required = false, defaultValue = "") String title, Model model) {
        List<Article> articles = articleService.searchArticles(pageNum, username, categoryCode, status, title);
        PageInfo<Article> page = new PageInfo(articles);
        List<Category> categories = categoryService.findCategoriesByType(CategoryType.ARTICLE.getType());

        model.addAttribute("page", page);
        model.addAttribute("categories", categories);
        model.addAttribute("articleStatus", ArticleStatus.values());
        return getPathList();
    }

    /**
     * 删除/恢复
     *
     * @param id
     * @param isDeleted
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{isDeleted:\\bundelete\\b|\\bdelete\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("USER_REVIEW")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        Article article = articleService.findArticleById(id);
        article.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
        articleService.updateArticle(article);

        model.addAttribute("article", article);
        return getPathTableTr();
    }

    /**
     * 审核通过/审核不通过
     *
     * @param id
     * @param status
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{status:\\bcomplete\\b|\\breject\\b|\\bwaiting\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("USER_REVIEW")
    public String status(@PathVariable("id") Long id, @PathVariable("status") String status, Model model) {
        Article article = articleService.findArticleById(id);
        article.setStatus(status);
        articleService.updateArticle(article);

        model.addAttribute("article", article);
        return getPathTableTr();
    }

    /**
     * 查看详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    public String detail(@PathVariable("id") Long id, Model model) {
        Article article = articleService.findArticleById(id);

        article.setContent(MarkdownUtil.markdownToHtml(article.getContent()));

        model.addAttribute("article", article);
        return getPathDetail();
    }

    /**
     * 编辑
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/edit", method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    public String edit(@PathVariable("id") Long id, Model model) {
        Article article = articleService.findArticleById(id);
        List<Category> categories = categoryService.findCategoriesByType(CategoryType.ARTICLE.getType());

        model.addAttribute("article", article);
        model.addAttribute("categories", categories);
        return getPathForm();
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/remove", method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        articleService.deleteArticleById(id);
        return super.getResultMap();
    }

    /**
     * 更新
     *
     * @param article
     * @param result
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @RequiresPermissions("USER_REVIEW")
    @ResponseBody
    public Map<String, Object> update(@ModelAttribute("article") Article article, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (result.hasErrors()) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "表单错误");

            return resultMap;
        }

        articleService.updateArticle(article);

        return resultMap;
    }

    /**
     * 上一章
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/prev", method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    public String prevArticle(@PathVariable("id") Long id, Model model) {
        Article article = articleService.findPrevArticle(id, null);
        if (article == null) {
            model.addAttribute("message", "这已经是第一篇文章了");
            model.addAttribute("id", id);
            return getPathRoot() + "/no-article";
        }

        article.setContent(MarkdownUtil.markdownToHtml(article.getContent()));

        model.addAttribute("article", article);
        return getPathDetail();
    }

    /**
     * 下一章
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/next", method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    public String nextArticle(@PathVariable("id") Long id, Model model) {
        Article article = articleService.findNextArticle(id, null);
        if (article == null) {
            model.addAttribute("message", "这已经是最后一篇文章了");
            model.addAttribute("id", id);
            return getPathRoot() + "/no-article";
        }

        article.setContent(MarkdownUtil.markdownToHtml(article.getContent()));

        model.addAttribute("article", article);
        return getPathDetail();
    }

    /**
     * 手动生成rss
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "rss", method = RequestMethod.GET)
    @RequiresPermissions("USER_REVIEW")
    @ResponseBody
    public String genRss(@RequestParam("username") String username) {
        articleService.genBlogRss(username);
        return "ok";
    }

}
