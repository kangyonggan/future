package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.constants.TokenType;
import com.kangyonggan.app.future.model.dto.RegisterResponse;
import com.kangyonggan.app.future.model.vo.Token;
import com.kangyonggan.app.future.model.vo.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 手机端
 *
 * @author kangyonggan
 * @since 8/11/17
 */
@RestController
@RequestMapping("m")
@Log4j2
public class MForgotController {

    @Autowired
    private TokenService tokenService;

    @Autowired
    private UserService userService;

    /**
     * 找回密码
     *
     * @param user
     * @param authCode
     * @return
     */
    @RequestMapping(value = "forgot", method = RequestMethod.POST)
    @ResponseBody
    public RegisterResponse register(User user, String authCode) {
        log.info("用户找回密码入参：{}, authCode:{}", user, authCode);
        RegisterResponse response = new RegisterResponse();

        try {
            Token token = tokenService.findTokenByMobileAndType(user.getUsername(), TokenType.FORGOT.getType());
            if (token == null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("验证码已失效，请重新获取");

                log.info("用户找回密码出参：{}", response);
                return response;
            }
            String realCaptcha = token.getCode();
            log.info("库中的验证码为：{}", realCaptcha);
            log.info("上送的验证码为：{}", authCode);

            if (!authCode.equalsIgnoreCase(realCaptcha)) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("验证码错误");

                log.info("用户找回密码出参：{}", response);
                return response;
            }

            userService.updateUserPassword(user);

            // 删除短信的token
            tokenService.deleteTokenById(token.getId());

            // 清除此用户的登录token
            tokenService.deleteTokensByMobileAndType(user.getUsername(), TokenType.LOGIN.getType());

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("找回密码异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        log.info("用户找回密码出参：{}", response);
        return response;
    }

}
