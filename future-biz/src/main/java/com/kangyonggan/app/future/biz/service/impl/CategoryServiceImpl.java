package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.biz.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.model.annotation.CacheGetOrSave;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.methodlogger.MethodLogger;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
@Service
public class CategoryServiceImpl extends BaseService<Category> implements CategoryService {

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("category:type:{0}:code:{1}")
    public Category findCategoryByTypeAndCode(String type, String code) {
        Category category = new Category();
        category.setType(type);
        category.setCode(code);
        category.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.selectOne(category);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("category:type:{0}")
    public List<Category> findCategoriesByType(String type) {
        Category category = new Category();
        category.setType(type);
        category.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.select(category);
    }
}
