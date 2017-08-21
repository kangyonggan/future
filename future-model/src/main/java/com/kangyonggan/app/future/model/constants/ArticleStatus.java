package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum ArticleStatus {

    WAITING("WAITING", "待审核"),
    COMPLETE("COMPLETE", "审核通过"),
    REJECT("REJECT", "审核未通过");

    /**
     * 状态
     */
    @Getter
    private final String status;

    /**
     * 状态名称
     */
    @Getter
    private final String name;

    ArticleStatus(String status, String name) {
        this.status = status;
        this.name = name;
    }

}
