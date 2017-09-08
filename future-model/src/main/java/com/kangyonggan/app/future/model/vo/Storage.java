package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "storage")
public class Storage implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 题目类型:{"jztk": "驾照题库"}
     */
    private String type;

    /**
     * 科目
     */
    private String subject;

    /**
     * 模式
     */
    private String model;

    /**
     * 问题配图
     */
    private String url;

    /**
     * 选项1
     */
    private String option1;

    /**
     * 选项2
     */
    private String option2;

    /**
     * 选项3
     */
    private String option3;

    /**
     * 选项4
     */
    private String option4;

    /**
     * 答案
     */
    private String answer;

    /**
     * 解析
     */
    private String explains;

    /**
     * 逻辑删除:{0:未删除, 1:已删除}
     */
    @Column(name = "is_deleted")
    private Byte isDeleted;

    /**
     * 创建时间
     */
    @Column(name = "created_time")
    private Date createdTime;

    /**
     * 更新时间
     */
    @Column(name = "updated_time")
    private Date updatedTime;

    /**
     * 问题
     */
    private String question;

    private static final long serialVersionUID = 1L;
}