package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.MenuService;
import com.kangyonggan.app.future.common.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.mapper.MenuMapper;
import com.kangyonggan.app.future.model.annotation.CacheDelete;
import com.kangyonggan.app.future.model.annotation.CacheDeleteAll;
import com.kangyonggan.app.future.model.annotation.CacheGetOrSave;
import com.kangyonggan.app.future.model.vo.Menu;
import com.kangyonggan.methodlogger.MethodLogger;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
@Service
public class MenuServiceImpl extends BaseService<Menu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("menu:username:{0}")
    public List<Menu> findMenusByUsername(String username) {
        List<Menu> menus = menuMapper.selectMenusByUsername(username);
        List<Menu> wrapList = new ArrayList();

        return recursionList(menus, wrapList, "", 0L);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("menu:role:{0}")
    public List<Menu> findMenus4Role(String code) {
        return menuMapper.selectMenus4Role(code);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public boolean existsMenuCode(String code) {
        Menu menu = new Menu();
        menu.setCode(code);

        return super.exists(menu);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("menu:all")
    public List<Menu> findAllMenus() {
        Example example = new Example(Menu.class);
        example.setOrderByClause("sort asc");

        List<Menu> menus = myMapper.selectByExample(example);
        List<Menu> wrapList = new ArrayList();

        return recursionTreeList(menus, wrapList, "", 0L);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("menu:all")
    public void saveMenu(Menu menu) {
        myMapper.insertSelective(menu);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("menu:id:{0}")
    public Menu findMenuById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public Menu findMenuByCode(String code) {
        Menu menu = new Menu();
        menu.setCode(code);

        return myMapper.selectOne(menu);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("menu:id:{0:id}||menu:all")
    @CacheDeleteAll("menu:username||menu:role")
    public void updateMenu(Menu menu) {
        myMapper.updateByPrimaryKeySelective(menu);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("menu:id:{0:id}||menu:all")
    @CacheDeleteAll("menu:username||menu:role")
    public void deleteMenu(Menu menu) {
        myMapper.deleteByPrimaryKey(menu);
    }

    /**
     * 递归找出 parentCode 下边的所有子节点
     *
     * @param from
     * @param toList
     * @param pcode
     * @param pid
     * @return
     */
    private List<Menu> recursionList(List<Menu> from, List<Menu> toList, String pcode, Long pid) {

        if (CollectionUtils.isEmpty(from)) {
            return null;
        }

        for (int i = 0; i < from.size(); i++) {
            Menu menu = from.get(i);
            if (pcode.equals(menu.getPcode())) {
                List<Menu> leaf = new ArrayList();
                menu.setLeaf(leaf);
                menu.setPid(pid);
                toList.add(menu);
                recursionList(from, leaf, menu.getCode(), menu.getId());
            }
        }
        return toList;
    }

    /**
     * 递归找出 parentCode 下边的所有子节点
     *
     * @param from
     * @param toList
     * @param pcode
     * @param pid
     * @return
     */
    private List<Menu> recursionTreeList(List<Menu> from, List<Menu> toList, String pcode, Long pid) {

        if (CollectionUtils.isEmpty(from)) {
            return null;
        }

        for (int i = 0; i < from.size(); i++) {
            Menu menu = from.get(i);
            if (pcode.equals(menu.getPcode())) {
                menu.setPid(pid);
                toList.add(menu);
                recursionTreeList(from, toList, menu.getCode(), menu.getId());
            }
        }
        return toList;
    }
}
