package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.SmsService;
import com.kangyonggan.app.future.biz.service.TokenService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.constants.TokenType;
import com.kangyonggan.app.future.model.dto.CommonResponse;
import com.kangyonggan.app.future.model.vo.Token;
import com.kangyonggan.app.future.model.vo.User;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@RestController
@RequestMapping("m/sms")
@Log4j2
public class MSmsController {

    @Autowired
    private SmsService smsService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private UserService userService;

    /**
     * 发送验证码
     *
     * @param mobile
     * @param type
     * @return
     */
    @RequestMapping(value = "send", method = RequestMethod.POST)
    public CommonResponse sendSms(@RequestParam("mobile") String mobile, @RequestParam("type") String type) {
        log.info("发短信请求入参:mobile:{}, type:{}", mobile, type);
        CommonResponse response = new CommonResponse();

        if (StringUtils.isEmpty(mobile) || StringUtils.isEmpty(type)) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("手机号不能为空");
            return response;
        }

        // 如果是注册，该手机号已被注册。如果是找回密码，该手机号尚未注册。
        if (TokenType.REGISTER.getType().equals(type)) {
            User u = userService.findUserByUsername(mobile);
            if (u != null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("该手机号已被注册");
                return response;
            }
        } else if (TokenType.FORGOT.getType().equals(type)) {
            User u = userService.findUserByUsername(mobile);
            if (u == null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("该手机号尚未注册");
                return response;
            }
        }

        // 60s内不准重复发送
        Token token = tokenService.findActiveTokenByMobileAndType(mobile, type);
        if (token != null) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("请勿频繁发短信");
            return response;
        }

        smsService.sendSms(mobile, type);

        response.setRespCo(Resp.SUCCESS.getRespCo());
        response.setRespMsg(Resp.SUCCESS.getRespMsg());

        log.info("发短信请求出参:{}", response);
        return response;
    }


}
