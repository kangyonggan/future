package com.kangyonggan.app.future.model.dto;

import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/30/17
 */
@Data
public class IdcardResponse extends CommonResponse {

    /**
     * 是否是身份证号码
     */
    private boolean isIdCard;

    /**
     * 省
     */
    private String province;

    /**
     * 年龄
     */
    private int age;

    /**
     * 年
     */
    private String year;

    /**
     * 月
     */
    private String month;

    /**
     * 日
     */
    private String day;

    /**
     * 性别
     */
    private String sex;

    /**
     * 地区
     */
    private String area;

    /**
     * 生肖
     */
    private String shengXiao;

    /**
     * 天干
     */
    private String ganZhi;

    /**
     * 运势
     */
    private String yunshi;

    /**
     * 转换后的号码
     */
    private String transCard;

}
