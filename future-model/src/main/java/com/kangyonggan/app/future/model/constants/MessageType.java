package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum MessageType {

    UPDATE_PASSWORD("UPDATE_PASSWORD", "修改密码"),
    SYSTEM("SYSTEM", "系统消息");

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

    MessageType(String type, String name) {
        this.type = type;
        this.name = name;
    }

}
