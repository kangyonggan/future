package com.kangyonggan.app.future.model.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
@Data
public class DbColumn implements Serializable {

    /**
     * 字段名
     */
    private String field;

    /**
     * 字段类型
     */
    private String type;

    /**
     * 字段备注
     */
    private String comment;

}
