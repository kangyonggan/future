package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.MessageService;
import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.Digests;
import com.kangyonggan.app.future.common.util.Encodes;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.MessageType;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.constants.TokenType;
import com.kangyonggan.app.future.model.dto.CommonResponse;
import com.kangyonggan.app.future.model.dto.TokenResponse;
import com.kangyonggan.app.future.model.vo.Message;
import com.kangyonggan.app.future.model.vo.Token;
import com.kangyonggan.app.future.model.vo.User;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
@RestController
@RequestMapping("mobile/user")
@Log4j2
public class MobileUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private MessageService messageService;

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");

    /**
     * 登录
     *
     * @param user
     * @param token
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public TokenResponse login(User user, String token) {
        log.info("进入用户登录");
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

            boolean isLoginSuccess = userService.isEqualPassword(user.getPassword(), u);
            if (isLoginSuccess) {
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

    /**
     * 注册
     *
     * @param user
     * @param authCode
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    public TokenResponse register(User user, String authCode) {
        log.info("进入用户注册");
        TokenResponse response = new TokenResponse();

        try {

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

            // 删除短信的token
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
        } catch (Exception e) {
            log.warn("注册异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        log.info("用户注册出参：{}", response);
        return response;
    }

    /**
     * 找回密码
     *
     * @param user
     * @param authCode
     * @return
     */
    @RequestMapping(value = "forgot", method = RequestMethod.POST)
    @ResponseBody
    public TokenResponse forgot(User user, String authCode) {
        log.info("进入用户找回密码");
        TokenResponse response = new TokenResponse();

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

    /**
     * 更新密码
     *
     * @param user
     * @param oldPassword
     * @param token
     * @return
     */
    @RequestMapping(value = "password", method = RequestMethod.POST)
    @ResponseBody
    public TokenResponse upadtePassword(User user, String oldPassword, String token) {
        log.info("进入用户修改密码");
        TokenResponse response = new TokenResponse();

        try {
            Token t = tokenService.findTokenByMobileAndType(user.getUsername(), TokenType.LOGIN.getType());
            if (t == null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("登录信息已过期，请退出后重新登录");

                log.info("用户修改密码出参：{}", response);
                return response;
            }
            String realToken = t.getCode();
            log.info("库中的token为：{}", realToken);
            log.info("上送的token为：{}", token);

            if (!realToken.equalsIgnoreCase(token)) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("登录信息已过期，请退出后重新登录");

                log.info("用户修改密码出参：{}", response);
                return response;
            }

            // 验证密码
            User u = userService.findUserByUsername(user.getUsername());
            boolean isRightPassword = userService.isEqualPassword(oldPassword, u);
            if (!isRightPassword) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("旧密码不正确");

                log.info("用户修改密码出参：{}", response);
                return response;
            }

            userService.updateUserPassword(user);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());

            // 发送系统通知
            Message message = new Message();
            message.setType(MessageType.UPDATE_PASSWORD.getType());
            message.setIsGroup((byte) 0);
            message.setCreatedUsername(user.getUsername());
            message.setTitle("修改密码通知");
            message.setContent("尊敬的用户，您好！您于" + dateFormat.format(new Date()) + "修改了密码，如非本人操作，请马上修改密码。");

            messageService.save(message, user.getUsername());
        } catch (Exception e) {
            log.warn("修改密码异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        log.info("用户修改密码出参：{}", response);
        return response;
    }

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public CommonResponse update(@ModelAttribute("user") User user) {
        user.setRealname(StringUtil.decode(user.getRealname()));
        CommonResponse response = new CommonResponse();

        try {
            userService.updateUserByUsername(user);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("修改用户信息异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

}
