package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.DictionaryService;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.mapper.DictionaryMapper;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Dictionary;
import com.kangyonggan.extra.core.annotation.Cache;
import com.kangyonggan.extra.core.annotation.CacheDel;
import com.kangyonggan.extra.core.annotation.Log;
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
    @Log
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
    @Log
    @Cache(key = "dictionary:id:${id}")
    public Dictionary findDictionaryById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @Log
    @CacheDel(key = {"dictionary:id:${dictionary.id}", "dictionary:type*", "dictionary:type:*:id*"})
    public void updateDictionary(Dictionary dictionary) {
        myMapper.updateByPrimaryKeySelective(dictionary);
    }

    @Override
    @Log
    @CacheDel(key = "dictionary:type*")
    public void saveDictionary(Dictionary dictionary) {
        myMapper.insertSelective(dictionary);
    }

    @Override
    @Log
    public boolean existsDictionaryCode(String code) {
        Dictionary dictionary = new Dictionary();
        dictionary.setCode(code);

        return super.exists(dictionary);
    }

    @Override
    @Log
    @Cache(key = "dictionary:type:${type}")
    public List<Dictionary> findDictionariesByType(String type) {
        Example example = new Example(Dictionary.class);
        example.createCriteria().andEqualTo("type", type).andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);

        example.setOrderByClause("sort asc");
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    @Cache(key = "dictionary:type:${type}:code:${code}")
    public Dictionary findDictionaryByTypeAndCode(String type, String code) {
        Dictionary dictionary = new Dictionary();
        dictionary.setType(type);
        dictionary.setCode(code);
        dictionary.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.selectOne(dictionary);
    }

    @Override
    @Log
    @CacheDel(key = {"dictionary:id:${id}", "dictionary:type*", "dictionary:type:*:id*"})
    public void deleteDictionaryById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }
}
