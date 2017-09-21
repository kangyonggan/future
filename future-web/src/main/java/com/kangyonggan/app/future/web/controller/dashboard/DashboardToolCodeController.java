package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.model.vo.Template;
import com.kangyonggan.app.future.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
@Controller
@RequestMapping("dashboard/tool/code")
@Log4j2
public class DashboardToolCodeController extends BaseController {

    /**
     * 列表
     *
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("TOOL_CODE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       Model model) {
        PageInfo<Template> page = new PageInfo(new ArrayList());

        model.addAttribute("page", page);
        return getPathList();
    }
}
