package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Token;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
public interface TokenService {

    /**
     * 报错token
     *
     * @param token
     */
    void saveToken(Token token);

    /**
     * 获取上次的token
     *
     * @param mobile
     * @param type
     */
    Token findTokenByMobileAndType(String mobile, String type);

    /**
     * 查找登录的token
     *
     * @param code
     * @param type
     * @return
     */
    Token findTokenByCodeAndType(String code, String type);

    /**
     * 删除验证码
     *
     * @param id
     */
    void deleteTokenById(Long id);

    /**
     * 查找60s内是否有发送验证码
     *
     * @param mobile
     * @param type
     * @return
     */
    Token findActiveTokenByMobileAndType(String mobile, String type);

    /**
     * 清除用户的登录token
     *
     * @param mobile
     * @param type
     */
    void deleteTokensByMobileAndType(String mobile, String type);
}
