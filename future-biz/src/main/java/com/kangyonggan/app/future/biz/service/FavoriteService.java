package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Favorite;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/19/17
 */
public interface FavoriteService {

    /**
     * 查找我的收藏
     *
     * @param pageNum
     * @param pageSize
     * @param username
     * @return
     */
    List<Favorite> findFavoritesByUsername(int pageNum, int pageSize, String username);

    /**
     * 收藏小说
     *
     * @param favorite
     */
    void saveFavorite(Favorite favorite);

    /**
     * 取消收藏
     *
     * @param username
     * @param bookCode
     */
    void deleteFavorite(String username, int bookCode);

    /**
     * 更新最后阅读的章节代码
     *
     * @param username
     * @param bookCode
     * @param lastSectionCode
     * @param lastSectionTitle
     */
    void updateFavoriteLastSection(String username, int bookCode, int lastSectionCode, String lastSectionTitle);

    /**
     * 查找我收藏的某本书籍
     *
     * @param username
     * @param bookCode
     * @return
     */
    Favorite findFavorite(String username, int bookCode);
}
