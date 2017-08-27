package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum DictionaryType {

    AREA("AREA", "地区"),
    ASCLL("ASCLL", "ascll码"),
    HTML("HTML", "html转移字符"),
    MESSAGE_TYPE("MESSAGE_TYPE", "消息类型");

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

    DictionaryType(String type, String name) {
        this.type = type;
        this.name = name;
    }

}
