package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Storage;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/8/17
 */
public interface StorageService {

    /**
     * 批量保存驾照题库
     */
    void saveJZTKStorages();

    /**
     * 分页获取题目
     *
     * @param pageNum
     * @param subject
     * @return
     */
    List<Storage> findStoragesByPage(int pageNum, String subject);

}
