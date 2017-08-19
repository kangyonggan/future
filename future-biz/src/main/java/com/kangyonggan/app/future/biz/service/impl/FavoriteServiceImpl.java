package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.FavoriteService;
import com.kangyonggan.app.future.biz.service.SectionService;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.vo.Favorite;
import com.kangyonggan.app.future.model.vo.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/19/17
 */
@Service
public class FavoriteServiceImpl extends BaseService<Favorite> implements FavoriteService {

    @Autowired
    private SectionService sectionService;

    @Override
    @LogTime
    public List<Favorite> findFavoritesByUsername(int pageNum, int pageSize, String username) {
        Example example = new Example(Favorite.class);
        example.createCriteria().andEqualTo("username", username);

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, pageSize);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public void saveFavorite(Favorite favorite) {
        myMapper.insertSelective(favorite);
    }

    @Override
    @LogTime
    public void deleteFavorite(String username, int bookCode) {
        Example example = new Example(Favorite.class);
        example.createCriteria().andEqualTo("username", username).andEqualTo("bookCode", bookCode);

        myMapper.deleteByExample(example);
    }

    @Override
    @LogTime
    public void updateFavoriteLastSection(Long id, int lastSectionCode, String lastSectionTitle) {
        Favorite favorite = new Favorite();
        favorite.setId(id);
        favorite.setLastSectionCode(lastSectionCode);
        favorite.setLastSectionTitle(lastSectionTitle);

        myMapper.updateByPrimaryKeySelective(favorite);
    }

    @Override
    @LogTime
    public Favorite findFavorite(String username, int bookCode) {
        Favorite favorite = new Favorite();
        favorite.setUsername(username);
        favorite.setBookCode(bookCode);

        return myMapper.selectOne(favorite);
    }
}
