package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "news")
public class News implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 代码
     */
    private String code;

    /**
     * 标题
     */
    private String title;

    /**
     * 来源
     */
    private String source;

    /**
     * 栏目代码
     */
    @Column(name = "category_code")
    private String categoryCode;

    /**
     * 栏目名称
     */
    @Column(name = "category_name")
    private String categoryName;

    /**
     * 封面图片
     */
    @Column(name = "image_url")
    private String imageUrl;

    /**
     * 图片数量
     */
    @Column(name = "gallary_image_count")
    private Integer gallaryImageCount;

    /**
     * 关键字(逗号分隔)
     */
    private String keywords;

    /**
     * 发布时间
     */
    @Column(name = "public_time")
    private Date publicTime;

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
     * 内容
     */
    private String content;

    private static final long serialVersionUID = 1L;
}