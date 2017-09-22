package com.kangyonggan.app.future.web.controller.dashboard;

import com.kangyonggan.app.future.biz.service.TableService;
import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;
import com.kangyonggan.app.future.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
@Controller
@RequestMapping("dashboard/tool/code")
@Log4j2
public class DashboardToolCodeController extends BaseController {

    @Autowired
    private TableService tableService;

    /**
     * 列表
     *
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("TOOL_CODE")
    public String list(Model model) {
        List<DbTable> tables = tableService.findAllTables();

        model.addAttribute("tables", tables);
        return getPathList();
    }

    /**
     * 生成向导
     *
     * @param tableName
     * @param model
     * @return
     */
    @RequestMapping(value = "{tableName:[\\w]+}/generate", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_CODE")
    public String generate(@PathVariable("tableName") String tableName, Model model) {
        List<DbTable> tables = tableService.findAllTables();
        DbTable table = getTable(tableName, tables);
        List<DbColumn> columns = tableService.findTableColumns(tableName);

        model.addAttribute("table", table);
        model.addAttribute("columns", columns);
        return getPathRoot() + "/generate";
    }

    private DbTable getTable(String tableName, List<DbTable> dbTables) {
        for (DbTable dbTable : dbTables) {
            if (tableName.equals(dbTable.getTableName())) {
                return dbTable;
            }
        }

        return null;
    }
}
