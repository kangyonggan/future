package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Music;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/4/17
 */
public interface MusicService {

    /**
     * 搜索音乐
     *
     * @param pageNum
     * @param name
     * @param singer
     * @param tags
     * @param uploadUsername
     * @param status
     * @param isStick
     * @param isDeleted
     * @return
     */
    List<Music> searchMusics(int pageNum, String name, String singer, String tags, String uploadUsername, String status, String isStick, String isDeleted);
}
