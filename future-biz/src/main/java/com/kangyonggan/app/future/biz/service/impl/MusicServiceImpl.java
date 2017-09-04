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

/**
 * @author kangyonggan
 * @since 9/4/17
 */
@Service
public class MusicServiceImpl extends BaseService<Music> implements MusicService {

    @Override
    @LogTime
    public List<Music> searchMusics(int pageNum, String name, String singer, String tags, String uploadUsername, String status, String isStick, String isDeleted) {
        Example example = new Example(Music.class);
        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(name)) {
            criteria.andLike("name", StringUtil.toLikeString(name));
        }
        if (StringUtils.isNotEmpty(singer)) {
            criteria.andLike("singer", StringUtil.toLikeString(singer));
        }
        if (StringUtils.isNotEmpty(tags)) {
            criteria.andLike("tags", StringUtil.toLikeString(tags));
        }
        if (StringUtils.isNotEmpty(status)) {
            criteria.andEqualTo("status", status);
        } else {
            criteria.andEqualTo("status", ArticleStatus.COMPLETE.getStatus());
        }
        if (StringUtils.isNotEmpty(uploadUsername)) {
            criteria.andEqualTo("uploadUsername", uploadUsername);
        }
        if (StringUtils.isNotEmpty(isStick)) {
            criteria.andEqualTo("isStick", isStick);
        }
        if (StringUtils.isNotEmpty(isDeleted)) {
            criteria.andEqualTo("isDeleted", isDeleted);
        } else {
            criteria.andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);
        }

        example.setOrderByClause("isStick desc, updatedTime desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }
}
