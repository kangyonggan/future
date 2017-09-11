package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.History;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryMapper extends MyMapper<History> {

    /**
     * 批量插入
     *
     * @param histories
     */
    void insertHistories(@Param("histories") List<History> histories);

}