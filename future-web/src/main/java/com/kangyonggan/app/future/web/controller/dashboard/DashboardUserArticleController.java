package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.ArticleService;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Article;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.app.future.model.vo.ShiroUser;
import com.kangyonggan.app.future.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
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
@RequestMapping("dashboard/user/article")
@Log4j2
public class DashboardUserArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    /**
     * 我的文章
     *
     * @param pageNum
     * @param categoryCode
     * @param status
     * @param title
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("USER_ARTICLE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "categoryCode", required = false, defaultValue = "") String categoryCode,
                       @RequestParam(value = "status", required = false, defaultValue = "") String status,
                       @RequestParam(value = "title", required = false, defaultValue = "") String title, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        List<Article> articles = articleService.searchArticles(pageNum, shiroUser.getUsername(), categoryCode, status, title);
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
    @RequiresPermissions("USER_ARTICLE")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Article article = articleService.findArticleById(id);

        // 防止删除别人的文章
        if (article.getUsername().equals(shiroUser.getUsername())) {
            article.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
            articleService.updateArticle(article);
        } else {
            log.error("用户{}试图逻辑删除他人的文章，id:{}, title:{}", shiroUser.getUsername(), article.getId(), article.getTitle());
        }

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
    @RequiresPermissions("USER_ARTICLE")
    public String detail(@PathVariable("id") Long id, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Article article = articleService.findArticleById(id);

        // 防止查看别人的文章
        if (!article.getUsername().equals(shiroUser.getUsername())) {
            return "404";
        }

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
    @RequiresPermissions("USER_ARTICLE")
    public String edit(@PathVariable("id") Long id, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Article article = articleService.findArticleById(id);
        // 防止编辑别人的文章
        if (!article.getUsername().equals(shiroUser.getUsername())) {
            return "404";
        }

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
    @RequiresPermissions("USER_ARTICLE")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        Map<String, Object> resultMap = getResultMap();

        ShiroUser shiroUser = userService.getShiroUser();
        Article article = articleService.findArticleById(id);

        // 防止删除别人的文章
        if (!article.getUsername().equals(shiroUser.getUsername())) {
            log.error("用户{}试图物理删除他人的文章，id:{}, title:{}", shiroUser.getUsername(), article.getId(), article.getTitle());
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "请勿试图删除他人的文章，已报警，予以警告！");
            return resultMap;
        }

        articleService.deleteArticleById(id);
        return resultMap;
    }

    /**
     * 更新
     *
     * @param article
     * @param result
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @RequiresPermissions("USER_ARTICLE")
    @ResponseBody
    public Map<String, Object> update(@ModelAttribute("article") Article article, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();
        ShiroUser shiroUser = userService.getShiroUser();
        Article at = articleService.findArticleById(article.getId());

        // 防止修改别人的文章
        if (!at.getUsername().equals(shiroUser.getUsername())) {
            log.error("用户{}试图修改他人的文章，id:{}, title:{}", shiroUser.getUsername(), article.getId(), article.getTitle());
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "请勿试图修改他人文章，已报警，予以警告！");
            return resultMap;
        }

        if (result.hasErrors()) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "表单错误");

            return resultMap;
        }

        articleService.updateArticle(article);

        return resultMap;
    }

    /**
     * 添加
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    @RequiresPermissions("USER_ARTICLE")
    public String create(Model model) {
        List<Category> categories = categoryService.findCategoriesByType(CategoryType.ARTICLE.getType());

        model.addAttribute("categories", categories);
        model.addAttribute("article", new Article());
        return getPathForm();
    }

    /**
     * 发布
     *
     * @param article
     * @param result
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("USER_ARTICLE")
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("article") Article article, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (result.hasErrors()) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "表单错误");

            return resultMap;
        }

        ShiroUser shiroUser = userService.getShiroUser();
        article.setUsername(shiroUser.getUsername());

        Category category = categoryService.findCategoryByTypeAndCode(CategoryType.ARTICLE.getType(), article.getCategoryCode());
        article.setCategoryName(category.getName());

        articleService.saveArticle(article);

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
    @RequiresPermissions("USER_ARTICLE")
    public String prevArticle(@PathVariable("id") Long id, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Article article = articleService.findPrevArticle(id, shiroUser.getUsername());
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
    @RequiresPermissions("USER_ARTICLE")
    public String nextArticle(@PathVariable("id") Long id, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Article article = articleService.findNextArticle(id, shiroUser.getUsername());
        if (article == null) {
            model.addAttribute("message", "这已经是最后一篇文章了");
            model.addAttribute("id", id);
            return getPathRoot() + "/no-article";
        }

        article.setContent(MarkdownUtil.markdownToHtml(article.getContent()));

        model.addAttribute("article", article);
        return getPathDetail();
    }

}
