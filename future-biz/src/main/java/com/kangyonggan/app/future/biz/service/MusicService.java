package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Music;

import java.util.List;
import java.util.Map;

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
     * @param uploadUsername
     * @return
     */
    List<Music> searchMusics(int pageNum, String name, String singer, String uploadUsername);


    /**
     * 搜索音乐 4 admin
     *
     * @param pageNum
     * @param name
     * @param singer
     * @param uploadUsername
     * @param status
     * @param isStick
     * @param isDeleted
     * @return
     */
    List<Music> searchMusics4Admin(int pageNum, String name, String singer, String uploadUsername, String status, String isStick, String isDeleted);

    /**
     * 保存音乐
     *
     * @param resultMap
     */
    void save(Map<String, Object> resultMap);

    /**
     * 查找音乐
     *
     * @param id
     * @return
     */
    Music findMusicById(Long id);

    /**
     * 更新音乐
     *
     * @param music
     */
    void updateMusic(Music music);

    /**
     * 物理删除
     *
     * @param id
     */
    void deleteMusicById(Long id);

}
