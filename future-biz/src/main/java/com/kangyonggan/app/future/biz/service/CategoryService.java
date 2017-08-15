package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Category;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
public interface CategoryService {

    /**
     * 查根据类型和代码找栏目
     *
     * @param type
     * @param code
     * @return
     */
    Category findCategoryByTypeAndCode(String type, String code);

    /**
     * 根据类型查找栏目
     *
     * @param type
     * @return
     */
    List<Category> findCategoriesByType(String type);

}
