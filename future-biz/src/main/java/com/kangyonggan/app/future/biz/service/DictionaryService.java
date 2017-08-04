package com.kangyonggan.app.future.biz.service;


import com.kangyonggan.app.future.model.vo.Dictionary;

import java.util.List;

/**
 * @author kangyonggan
 * @since 5/3/17
 */
public interface DictionaryService {

    /**
     * 搜索字典
     *
     * @param pageNum
     * @param type
     * @param value
     * @return
     */
    List<Dictionary> searchDictionsries(int pageNum, String type, String value);

    /**
     * 查找字典
     *
     * @param id
     * @return
     */
    Dictionary findDictionaryById(Long id);

    /**
     * 更新字典
     *
     * @param dictionary
     */
    void updateDictionary(Dictionary dictionary);

    /**
     * 保存字典
     *
     * @param dictionary
     */
    void saveDictionary(Dictionary dictionary);

    /**
     * 校验字典代码是否存在
     *
     * @param code
     * @return
     */
    boolean existsDictionaryCode(String code);

    /**
     * 查找一类字典
     *
     * @param type
     * @return
     */
    List<Dictionary> findDictionariesByType(String type);

    /**
     * 查找字典
     *
     * @param type
     * @param code
     * @return
     */
    Dictionary findDictionaryByTypeAndCode(String type, String code);

    /**
     * 删除字典
     *
     * @param id
     */
    void deleteDictionaryById(Long id);
}
