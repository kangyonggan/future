package com.kangyonggan.app.future.web.controller.web;

import com.kangyonggan.app.future.biz.service.SmsService;
import com.kangyonggan.extra.core.annotation.Frequency;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
@RestController
@RequestMapping("sms")
public class SmsController {

    @Autowired
    private SmsService smsService;

    /**
     * 发送验证码
     *
     * @param mobile
     * @param type
     * @return
     */
    @RequestMapping(value = "send", method = RequestMethod.POST)
    @Frequency(key = "sms:${mobile}", interval = 60000, interrupt = true)
    public boolean sendSms(@RequestParam("mobile") String mobile, @RequestParam("type") String type) {
        if (StringUtils.isEmpty(mobile) || StringUtils.isEmpty(type)) {
            return false;
        }

        smsService.sendSms(mobile, type);
        return true;
    }

}
