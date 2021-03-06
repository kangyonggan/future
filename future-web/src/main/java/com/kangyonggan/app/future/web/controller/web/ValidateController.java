package com.kangyonggan.app.future.web.controller.web;

import com.kangyonggan.app.future.biz.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author kangyonggan
 * @since 2016/12/3
 */
@Controller
@RequestMapping("validate")
public class ValidateController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private TemplateService templateService;

    /**
     * 校验手机号是否可用
     *
     * @param username
     * @param oldUsername
     * @return
     */
    @RequestMapping(value = "user", method = RequestMethod.POST)
    @ResponseBody
    public boolean validateUsername(@RequestParam("username") String username,
                                    @RequestParam(value = "oldUsername", required = false, defaultValue = "") String oldUsername) {
        if (username.equals(oldUsername)) {
            return true;
        }

        return !userService.existsUsername(username);
    }

    /**
     * 校验手机号是否存在
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "user/exists", method = RequestMethod.POST)
    @ResponseBody
    public boolean validateUsername(@RequestParam("username") String username) {
        return userService.existsUsername(username);
    }

    /**
     * 校验角色代码是否可用
     *
     * @param code
     * @param oldCode
     * @return
     */
    @RequestMapping(value = "role", method = RequestMethod.POST)
    @ResponseBody
    public boolean validateRoleCode(@RequestParam("code") String code,
                                    @RequestParam(value = "oldCode", required = false, defaultValue = "") String oldCode) {
        if (code.equals(oldCode)) {
            return true;
        }

        return !roleService.existsRoleCode(code);
    }

    /**
     * 校验菜单代码是否可用
     *
     * @param code
     * @param oldCode
     * @return
     */
    @RequestMapping(value = "menu", method = RequestMethod.POST)
    @ResponseBody
    public boolean validateMenuCode(@RequestParam("code") String code,
                                    @RequestParam(value = "oldCode", required = false, defaultValue = "") String oldCode) {
        if (code.equals(oldCode)) {
            return true;
        }

        return !menuService.existsMenuCode(code);
    }

    /**
     * 校验字典代码是否可用
     *
     * @param code
     * @param oldCode
     * @return
     */
    @RequestMapping(value = "dictionary", method = RequestMethod.POST)
    @ResponseBody
    public boolean validateDictionaryCode(@RequestParam("code") String code,
                                          @RequestParam(value = "oldCode", required = false, defaultValue = "") String oldCode) {
        if (code.equals(oldCode)) {
            return true;
        }

        return !dictionaryService.existsDictionaryCode(code);
    }

    /**
     * 模板名称是否可用
     *
     * @param name
     * @param oldName
     * @return
     */
    @RequestMapping(value = "template", method = RequestMethod.POST)
    @ResponseBody
    public boolean validateTemplateName(@RequestParam("name") String name,
                                          @RequestParam(value = "oldName", required = false, defaultValue = "") String oldName) {
        if (name.equals(oldName)) {
            return true;
        }

        return !templateService.existsTemplateName(name);
    }

}