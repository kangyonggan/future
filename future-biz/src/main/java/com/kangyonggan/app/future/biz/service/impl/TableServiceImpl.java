package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.TableService;
import com.kangyonggan.app.future.common.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.mapper.TableMapper;
import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;
import com.kangyonggan.methodlogger.MethodLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
@Service
public class TableServiceImpl implements TableService {

    @Autowired
    private TableMapper tableMapper;

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public List<DbTable> findAllTables() {
        return tableMapper.selectAllTables();
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public List<DbColumn> findTableColumns(String tableName) {
        return tableMapper.selectTableColumns(tableName);
    }

    @Override
    public DbTable findTableByName(String tableName) {
        List<DbTable> tables = findAllTables();
        for (DbTable table : tables) {
            if (tableName.equals(table.getTableName())) {
                return table;
            }
        }

        return null;
    }

}
