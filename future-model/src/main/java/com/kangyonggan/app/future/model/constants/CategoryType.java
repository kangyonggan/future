package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum CategoryType {

    BOOK("BOOK", "小说"),
    ARTICLE("ARTICLE", "文章");

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

    CategoryType(String type, String name) {
        this.type = type;
        this.name = name;
    }

}
