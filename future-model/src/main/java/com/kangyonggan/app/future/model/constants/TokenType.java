package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum TokenType {

    REGISTER("REGISTER", "注册验证码"),
    RESET("RESET", "找回密码验证码");

    /**
     * 类型
     */
    @Getter
    private final String type;

    /**
     * 类型名称
     */
    @Getter
    private final String name;

    TokenType(String type, String name) {
        this.type = type;
        this.name = name;
    }

}
