package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.biz.service.TableService;
import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
public class DemoServiceTest extends AbstractServiceTest {

    @Autowired
    private TableService tableService;

    @Test
    public void testFindAllTables() {
        List<DbTable> list = tableService.findAllTables();
        System.out.println(list);
    }

    @Test
    public void testFindTableColumns() {
        List<DbColumn> list = tableService.findTableColumns("article");
        System.out.println(list);
    }

}
