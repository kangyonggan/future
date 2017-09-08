package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.Storage;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StorageMapper extends MyMapper<Storage> {

    /**
     * 批量保存题库
     *
     * @param storages
     */
    void insertStorages(@Param("storages") List<Storage> storages);
}