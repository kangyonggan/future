package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.DictionaryService;
import com.kangyonggan.app.future.common.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.mapper.DictionaryMapper;
import com.kangyonggan.app.future.model.annotation.CacheDelete;
import com.kangyonggan.app.future.model.annotation.CacheDeleteAll;
import com.kangyonggan.app.future.model.annotation.CacheGetOrSave;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Dictionary;
import com.kangyonggan.methodlogger.MethodLogger;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
@Service
public class DictionaryServiceImpl extends BaseService<Dictionary> implements DictionaryService {

    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Override
//    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public List<Dictionary> searchDictionsries(int pageNum, String type, String value) {
        Example example = new Example(Dictionary.class);
        Example.Criteria criteria = example.createCriteria();

        if (StringUtils.isNotEmpty(type)) {
            criteria.andEqualTo("type", type);
        }

        if (StringUtils.isNotEmpty(value)) {
            criteria.andLike("value", StringUtil.toLikeString(value));
        }

        example.setOrderByClause("type desc, sort asc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("dictionary:id:{0}")
    public Dictionary findDictionaryById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("dictionary:id:{0:id}")
    @CacheDeleteAll("dictionary:type||dictionary:type:*:id")
    public void updateDictionary(Dictionary dictionary) {
        myMapper.updateByPrimaryKeySelective(dictionary);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDeleteAll("dictionary:type")
    public void saveDictionary(Dictionary dictionary) {
        myMapper.insertSelective(dictionary);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public boolean existsDictionaryCode(String code) {
        Dictionary dictionary = new Dictionary();
        dictionary.setCode(code);

        return super.exists(dictionary);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("dictionary:type:{0}")
    public List<Dictionary> findDictionariesByType(String type) {
        Example example = new Example(Dictionary.class);
        example.createCriteria().andEqualTo("type", type).andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);

        example.setOrderByClause("sort asc");
        return myMapper.selectByExample(example);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("dictionary:type:{0}:code:{1}")
    public Dictionary findDictionaryByTypeAndCode(String type, String code) {
        Dictionary dictionary = new Dictionary();
        dictionary.setType(type);
        dictionary.setCode(code);
        dictionary.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.selectOne(dictionary);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("dictionary:id:{0:id}")
    @CacheDeleteAll("dictionary:type||dictionary:type:*:id")
    public void deleteDictionaryById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }
}
