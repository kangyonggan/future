package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
public interface TableService {

    /**
     * 查找所有表信息
     *
     * @return
     */
    List<DbTable> findAllTables();

    /**
     * 查找表的所有列
     *
     * @param tableName
     * @return
     */
    List<DbColumn> findTableColumns(String tableName);

    /**
     * 查找table
     *
     * @param tableName
     * @return
     */
    DbTable findTableByName(String tableName);

}
