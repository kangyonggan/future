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
        example.createCriteria().andEqualTo("username", username);
        example.createCriteria().andEqualTo("bookCode", bookCode);

        myMapper.deleteByExample(example);
    }

    @Override
    @LogTime
    public void updateFavoriteLastSection(String username, int bookCode, int lastSectionCode) {
        Section section = sectionService.findSectionByCode(lastSectionCode);

        Favorite favorite = new Favorite();
        favorite.setLastSectionCode(lastSectionCode);
        favorite.setLastSectionTitle(section.getTitle());

        Example example = new Example(Favorite.class);
        example.createCriteria().andEqualTo("username", username).andEqualTo("bookCode", bookCode);

        myMapper.updateByExampleSelective(favorite, example);
    }
}
