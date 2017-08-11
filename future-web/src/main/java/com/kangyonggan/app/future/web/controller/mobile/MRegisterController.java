package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.Digests;
import com.kangyonggan.app.future.common.util.Encodes;
import com.kangyonggan.app.future.model.constants.AppConstants;
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
public class MRegisterController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    /**
     * 注册
     *
     * @param user
     * @param authCode
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public RegisterResponse register(User user, String authCode) {
        log.info("用户注册入参：{}, authCode:{}", user, authCode);
        RegisterResponse response = new RegisterResponse();

        Token token = tokenService.findTokenByMobileAndType(user.getUsername(), TokenType.REGISTER.getType());
        if (token == null) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("验证码已失效，请重新获取");

            log.info("用户注册出参：{}", response);
            return response;
        }
        String realCaptcha = token.getCode();
        log.info("库中的验证码为：{}", realCaptcha);
        log.info("上送的验证码为：{}", authCode);

        if (!authCode.equalsIgnoreCase(realCaptcha)) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("验证码错误");

            log.info("用户注册出参：{}", response);
            return response;
        }

        try {
            userService.saveUserWithDefaultRole(user);
        } catch (Exception e) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("该手机号已被注册");
        }

        // 删除token
        tokenService.deleteTokenById(token.getId());

        response.setRespCo(Resp.SUCCESS.getRespCo());
        response.setRespMsg(Resp.SUCCESS.getRespMsg());
        String code = Encodes.encodeHex(Digests.generateSalt(AppConstants.SALT_SIZE));
        response.setToken(code);

        // 清除此用户的登录token
        tokenService.deleteTokensByMobileAndType(user.getUsername(), TokenType.LOGIN.getType());

        // 保存登录的token
        Token tk = new Token();
        tk.setCode(code);
        tk.setMobile(user.getUsername());
        tk.setType(TokenType.LOGIN.getType());
        tokenService.saveToken(tk);

        log.info("用户注册出参：{}", response);
        return response;
    }

}
