package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableMapper {

    List<DbTable> selectAllTables();

    List<DbColumn> selectTableColumns(@Param("tableName") String tableName);
}