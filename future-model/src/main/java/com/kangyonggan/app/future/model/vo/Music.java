package com.kangyonggan.app.future.model.vo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import lombok.Data;

@Data
@Table(name = "music")
public class Music implements Serializable {
    /**
     * 主键, 自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 歌曲名
     */
    private String name;

    /**
     * 歌手
     */
    private String singer;

    /**
     * 专辑
     */
    private String album;

    /**
     * 专辑封面路径
     */
    @Column(name = "album_cover_path")
    private String albumCoverPath;

    /**
     * 时长(秒)
     */
    private Integer duration;

    /**
     * 文件大小(byte)
     */
    private Long size;

    /**
     * 上传人
     */
    @Column(name = "upload_username")
    private String uploadUsername;

    /**
     * 状态:{"waiting":"待审核", "reject":"审核未通过", "complete":"审核通过"}
     */
    private String status;

    /**
     * 审核人
     */
    @Column(name = "adjust_username")
    private String adjustUsername;

    /**
     * 是否置顶:{0:未置顶, 1:已置顶}
     */
    @Column(name = "is_stick")
    private Byte isStick;

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

    private static final long serialVersionUID = 1L;
}