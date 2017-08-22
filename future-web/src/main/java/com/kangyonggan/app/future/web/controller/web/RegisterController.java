package com.kangyonggan.app.future.web.controller.web;

import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.model.constants.TokenType;
import com.kangyonggan.app.future.model.vo.Token;
import com.kangyonggan.app.future.model.vo.User;
import com.kangyonggan.app.future.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
@Controller
@RequestMapping("user/register")
@Log4j2
public class RegisterController extends BaseController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return getPathIndex();
    }

    @RequestMapping(value = "success", method = RequestMethod.GET)
    public String registerSuccess() {
        return getPathRoot() + "/success";
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> register(@ModelAttribute("user") @Valid User user, BindingResult result,
                                        @RequestParam("captcha") String captcha) {
        Map<String, Object> resultMap = getResultMap();

        Token token = tokenService.findTokenByMobileAndType(user.getUsername(), TokenType.REGISTER.getType());
        if (token == null) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "验证码已失效，请重新获取");
            return resultMap;
        }
        String realCaptcha = token.getCode();
        log.info("库中的验证码为：{}", realCaptcha);
        log.info("上送的验证码为：{}", captcha);

        if (!captcha.equalsIgnoreCase(realCaptcha)) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "验证码错误");
            return resultMap;
        }

        tokenService.deleteTokenById(token.getId());
        userService.saveUserWithDefaultRole(user);

        return resultMap;
    }

}
