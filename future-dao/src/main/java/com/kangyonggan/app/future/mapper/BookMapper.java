package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper extends MyMapper<Book> {

    /**
     * 查找所有分类，带有小说总数
     *
     * @return
     */
    List<Category> selectAllCategoryWithBookCount();

    /**
     * 查找我的收藏
     *
     * @param username
     * @return
     */
    List<Book> selectFavoriteBooksByUsername(@Param("username") String username);

    /**
     * 添加收藏
     *
     * @param username
     * @param bookCode
     * @param lastSectionCode
     */
    void insertFavorite(@Param("username") String username, @Param("bookCode") int bookCode, @Param("lastSectionCode") int lastSectionCode);

    /**
     * 删除收藏
     *
     * @param username
     * @param bookCode
     */
    void deleteFavorite(@Param("username") String username, @Param("bookCode") int bookCode);

    /**
     * 查找我的收藏
     *
     * @param username
     * @param bookCode
     * @return
     */
    Book selectFavorite(@Param("username") String username, @Param("bookCode") int bookCode);

    /**
     * 更新我的收藏
     *
     * @param username
     * @param bookCode
     * @param lastSectionCode
     */
    void updateFavoriteLastSection(@Param("username") String username, @Param("bookCode") Integer bookCode, @Param("lastSectionCode") Integer lastSectionCode);

    /**
     * 搜索收藏的书籍
     *
     * @param username
     * @param bookCode
     * @param bookName
     */
    List<Book> searchFavoriteBooks(@Param("username") String username, @Param("bookCode") String bookCode, @Param("bookName") String bookName);
}