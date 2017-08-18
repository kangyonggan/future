package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.model.constants.TokenType;
import com.kangyonggan.app.future.model.vo.Token;
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
 * @since 2017/1/9
 */
@Controller
@RequestMapping("dashboard/system/token")
public class DashboardSystemTokenController extends BaseController {

    @Autowired
    private TokenService tokenService;

    /**
     * 验证码列表
     *
     * @param pageNum
     * @param type
     * @param mobile
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_TOKEN")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "type", required = false, defaultValue = "") String type,
                       @RequestParam(value = "mobile", required = false, defaultValue = "") String mobile,
                       Model model) {
        List<Token> tokens = tokenService.searchTokens(pageNum, type, mobile);
        PageInfo<Token> page = new PageInfo(tokens);

        model.addAttribute("page", page);
        model.addAttribute("types", TokenType.values());
        return getPathList();
    }

}
