package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.Digests;
import com.kangyonggan.app.future.common.util.Encodes;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.constants.TokenType;
import com.kangyonggan.app.future.model.dto.TokenResponse;
import com.kangyonggan.app.future.model.vo.Token;
import com.kangyonggan.app.future.model.vo.User;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 手机端
 *
 * @author kangyonggan
 * @since 8/11/17
 */
@RestController
@RequestMapping("mobile/login")
@Log4j2
public class MobileLoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    /**
     * 登录
     *
     * @param user
     * @param token
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public TokenResponse login(User user, String token) {
        log.info("用户登录入参:{}, token={}", user, token);
        TokenResponse response = new TokenResponse();

        try {
            // 使用token登录
            if (StringUtils.isNotEmpty(token)) {
                Token tk = tokenService.findTokenByCodeAndType(token, TokenType.LOGIN.getType());
                if (tk != null) {
                    response.setRespCo(Resp.SUCCESS.getRespCo());
                    response.setRespMsg(Resp.SUCCESS.getRespMsg());
                    response.setToken(token);

                    log.info("用户登录出参：{}", response);
                    return response;
                }
            }

            // 入参校验
            if (user == null || StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getPassword())) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("手机号或密码为空");
                log.info("用户登录出参：{}", response);
                return response;
            }

            User u = userService.findUserByUsername(user.getUsername());
            if (u == null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("该手机号尚未注册");
                log.info("用户登录出参：{}", response);
                return response;
            }

            boolean idLoginSuccess = userService.isEqualPassword(user.getPassword(), u);
            if (idLoginSuccess) {
                response.setRespCo(Resp.SUCCESS.getRespCo());
                response.setRespMsg(Resp.SUCCESS.getRespMsg());
                token = Encodes.encodeHex(Digests.generateSalt(AppConstants.SALT_SIZE));
                response.setToken(token);

                u.setPassword("");
                u.setSalt("");
                response.setUser(u);

                // 清除此用户的登录token
                tokenService.deleteTokensByMobileAndType(user.getUsername(), TokenType.LOGIN.getType());

                // 保存登录的token
                Token tk = new Token();
                tk.setCode(token);
                tk.setMobile(user.getUsername());
                tk.setType(TokenType.LOGIN.getType());
                tokenService.saveToken(tk);
            } else {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("密码错误");
            }
        } catch (Exception e) {
            log.warn("登录异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        log.info("用户登录出参：{}", response);
        return response;
    }

}
