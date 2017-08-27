package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum MessageType {

    SYSTEM("SYSTEM", "系统消息"),
    ADVICE("ADVICE", "意见反馈"),
    REPLY("REPLY", "反馈结果"),
    UPDATE_PASSWORD("UPDATE_PASSWORD", "修改密码");

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
