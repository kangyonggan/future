package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.MusicService;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.vo.Music;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 9/4/17
 */
@Service
public class MusicServiceImpl extends BaseService<Music> implements MusicService {

    @Override
    @LogTime
    public List<Music> searchMusics(int pageNum, String name, String singer, String uploadUsername) {
        Example example = new Example(Music.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("status", ArticleStatus.COMPLETE.getStatus());
        criteria.andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);

        if (StringUtils.isNotEmpty(name)) {
            criteria.andLike("name", StringUtil.toLikeString(name));
        }
        if (StringUtils.isNotEmpty(singer)) {
            criteria.andLike("singer", StringUtil.toLikeString(singer));
        }
        if (StringUtils.isNotEmpty(uploadUsername)) {
            criteria.andEqualTo("uploadUsername", uploadUsername);
        }

        example.setOrderByClause("is_stick desc, updated_time desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public List<Music> searchMusics4Admin(int pageNum, String name, String singer, String uploadUsername, String status, String isStick, String isDeleted) {
        Example example = new Example(Music.class);
        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(name)) {
            criteria.andLike("name", StringUtil.toLikeString(name));
        }
        if (StringUtils.isNotEmpty(singer)) {
            criteria.andLike("singer", StringUtil.toLikeString(singer));
        }
        if (StringUtils.isNotEmpty(status)) {
            criteria.andEqualTo("status", status);
        }
        if (StringUtils.isNotEmpty(uploadUsername)) {
            criteria.andEqualTo("uploadUsername", uploadUsername);
        }
        if (StringUtils.isNotEmpty(isStick)) {
            criteria.andEqualTo("isStick", isStick);
        }
        if (StringUtils.isNotEmpty(isDeleted)) {
            criteria.andEqualTo("isDeleted", isDeleted);
        }

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public void save(Map<String, Object> resultMap) {
        Music music = new Music();
        music.setName((String) resultMap.get("name"));
        music.setSinger((String) resultMap.get("singer"));
        music.setAlbum((String) resultMap.get("album"));
        music.setAlbumCoverPath("cover/" + resultMap.get("albumName"));
        music.setDuration((Integer) resultMap.get("duration"));
        music.setSize((Long) resultMap.get("size"));
        music.setUploadUsername((String) resultMap.get("uploadUsername"));

        myMapper.insertSelective(music);
    }

    @Override
    @LogTime
    public Music findMusicById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @LogTime
    public void updateMusic(Music music) {
        myMapper.updateByPrimaryKeySelective(music);
    }

    @Override
    @LogTime
    public void deleteMusicById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }

    @Override
    @LogTime
    public List<Music> findMusicsByPage(int pageNum, int pageSize) {
        Example example = new Example(Music.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("status", ArticleStatus.COMPLETE.getStatus());
        criteria.andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);

        example.setOrderByClause("is_stick desc, updated_time desc");

        PageHelper.startPage(pageNum, pageSize);
        return myMapper.selectByExample(example);
    }
}
