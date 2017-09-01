package com.kangyonggan.app.future.biz.service;

/**
 * @author kangyonggan
 * @since 4/12/17
 */
public interface MailService {

    /**
     * 异步发送邮件
     *
     * @param to
     * @param title
     * @param text
     */
    void send(String to, String title, String text);

}
