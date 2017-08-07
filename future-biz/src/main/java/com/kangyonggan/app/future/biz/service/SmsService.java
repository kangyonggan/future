package com.kangyonggan.app.future.biz.service;

/**
 * @author kangyonggan
 * @since 2017/2/9
 */
public interface SmsService {

    /**
     * 发送短信
     *
     * @param mobile
     * @param type
     */
    void sendSms(String mobile, String type);
}
