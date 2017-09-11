package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.History;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/11/17
 */
public interface HistoryService {

    /**
     * 查找历史今天
     *
     * @param month
     * @param day
     * @return
     */
    List<History> findHistories(int month, int day);

    /**
     * 初始化数据
     */
    void saveHistories();


}
