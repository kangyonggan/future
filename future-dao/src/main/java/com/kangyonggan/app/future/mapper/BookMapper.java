package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
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
}