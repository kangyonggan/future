package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.TemplateService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.model.vo.ShiroUser;
import com.kangyonggan.app.future.model.vo.Template;
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
 * @since 9/18/17
 */
@Controller
@RequestMapping("dashboard/tool/template")
@Log4j2
public class DashboardToolTemplateController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private TemplateService templateService;

    /**
     * 我的模板
     *
     * @param pageNum
     * @param name
     * @param type
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("TOOL_TEMPLATE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "name", required = false, defaultValue = "") String name,
                       @RequestParam(value = "type", required = false, defaultValue = "") String type,
                       Model model) {
        ShiroUser shiroUser = userService.getShiroUser();

        List<String> types = templateService.findTypes(shiroUser.getUsername());
        List<Template> templates = templateService.searchTemplates(pageNum, name, type, shiroUser.getUsername());
        PageInfo<Template> page = new PageInfo(templates);

        model.addAttribute("page", page);
        model.addAttribute("types", types);
        return getPathList();
    }

    /**
     * 新增
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_TEMPLATE")
    public String create(Model model) {
        model.addAttribute("template", new Template());
        return getPathForm();
    }

    /**
     * 保存
     *
     * @param template
     * @param result
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("TOOL_TEMPLATE")
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("template") Template template, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (result.hasErrors()) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "表单错误");

            return resultMap;
        }

        ShiroUser shiroUser = userService.getShiroUser();
        template.setUsername(shiroUser.getUsername());

        try {
            templateService.saveTemplate(template);
        } catch (Exception e) {
            log.warn("模板保存失败", e);
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "模板保存失败");

            return resultMap;
        }

        return resultMap;
    }

    /**
     * 编辑
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/edit", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_TEMPLATE")
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("template", templateService.findTempateById(id));
        return getPathForm();
    }

    /**
     * 更新
     *
     * @param template
     * @param result
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @RequiresPermissions("TOOL_TEMPLATE")
    @ResponseBody
    public Map<String, Object> update(@ModelAttribute("template") Template template, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (result.hasErrors()) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "表单错误");

            return resultMap;
        }

        ShiroUser shiroUser = userService.getShiroUser();
        Template t = templateService.findTempateById(template.getId());
        // 防止更新别人的文章
        if (!t.getUsername().equals(shiroUser.getUsername())) {
            log.error("用户{}试图更新他人的模板，id:{}, name:{}", shiroUser.getUsername(), template.getId(), template.getName());
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "请勿试图更新他人的模板，已报警，予以警告！");
            return resultMap;
        }

        try {
            templateService.updateTemplate(template);
        } catch (Exception e) {
            log.warn("模板更新失败", e);
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "模板更新失败");
            return resultMap;
        }
        return resultMap;
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
    @RequiresPermissions("TOOL_TEMPLATE")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Template template = templateService.findTempateById(id);

        // 防止删除别人的模板
        if (template.getUsername().equals(shiroUser.getUsername())) {
            template.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
            try {
                templateService.updateTemplate(template);
            } catch (Exception e) {
                log.warn("模板更新失败", e);
            }
        } else {
            log.error("用户{}试图逻辑删除他人的模板，id:{}, name:{}", shiroUser.getUsername(), template.getId(), template.getName());
        }

        model.addAttribute("template", template);
        return getPathTableTr();
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/remove", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_TEMPLATE")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        Map<String, Object> resultMap = getResultMap();

        ShiroUser shiroUser = userService.getShiroUser();
        Template template = templateService.findTempateById(id);

        // 防止删除别人的模板
        if (!template.getUsername().equals(shiroUser.getUsername())) {
            log.error("用户{}试图物理删除他人的模板，id:{}, name:{}", shiroUser.getUsername(), template.getId(), template.getName());
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "请勿试图删除他人的模板，已报警，予以警告！");
            return resultMap;
        }

        templateService.deleteTemplateById(id);
        return resultMap;
    }

    /**
     * 代码生成
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/generate", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_TEMPLATE")
    public String generate(@PathVariable("id") Long id, Model model) {
        model.addAttribute("template", templateService.findTempateById(id));
        return getPathRoot() + "/generate";
    }

    /**
     * 更新
     *
     * @param id
     * @param dataSource
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/generate", method = RequestMethod.POST)
//    @RequiresPermissions("TOOL_TEMPLATE")
    @ResponseBody
    public Map<String, Object> generate(@PathVariable("id") Long id, @RequestParam("dataSource") String dataSource) {
        Map<String, Object> resultMap = getResultMap();
        Template template = templateService.findTempateById(id);

        // 代码生成
        String result = templateService.generate(template.getName(), dataSource);
        resultMap.put("result", result);

        template.setDataSource(dataSource);
        try {
            templateService.updateTemplate(template);
        } catch (Exception e) {
            log.warn("模板更新失败", e);
        }
        resultMap.put("template", template);

        return resultMap;
    }

}
