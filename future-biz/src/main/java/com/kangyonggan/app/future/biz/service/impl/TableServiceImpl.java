package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.TableService;
import com.kangyonggan.app.future.mapper.TableMapper;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;
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
    @LogTime
    public List<DbTable> findAllTables() {
        return tableMapper.selectAllTables();
    }

    @Override
    @LogTime
    public List<DbColumn> findTableColumns(String tableName) {
        return tableMapper.selectTableColumns(tableName);
    }

}
