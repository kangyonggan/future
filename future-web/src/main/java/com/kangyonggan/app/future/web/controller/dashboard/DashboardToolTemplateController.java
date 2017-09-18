package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.TemplateService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.model.vo.ShiroUser;
import com.kangyonggan.app.future.model.vo.Template;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
@Controller
@RequestMapping("dashboard/tool/template")
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

}
