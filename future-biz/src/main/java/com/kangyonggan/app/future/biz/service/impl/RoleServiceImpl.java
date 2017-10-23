package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.RoleService;
import com.kangyonggan.app.future.biz.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.mapper.RoleMapper;
import com.kangyonggan.app.future.model.annotation.CacheDelete;
import com.kangyonggan.app.future.model.annotation.CacheDeleteAll;
import com.kangyonggan.app.future.model.annotation.CacheGetOrSave;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Role;
import com.kangyonggan.methodlogger.MethodLogger;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Arrays;
import java.util.List;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
@Service
public class RoleServiceImpl extends BaseService<Role> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("role:username:{0}")
    public List<Role> findRolesByUsername(String username) {
        return roleMapper.selectRolesByUsername(username);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public boolean existsRoleCode(String code) {
        Role role = new Role();
        role.setCode(code);

        return super.exists(role);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("role:all")
    public List<Role> findAllRoles() {
        Role role = new Role();
        role.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.select(role);
    }

    @Override
    public List<Role> searchRoles(int pageNum, String code, String name) {
        Example example = new Example(Role.class);

        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(code)) {
            criteria.andLike("code", StringUtil.toLikeString(code));
        }
        if (StringUtils.isNotEmpty(name)) {
            criteria.andLike("name", StringUtil.toLikeString(name));
        }

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public void saveRole(Role role) {
        myMapper.insertSelective(role);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheGetOrSave("role:id:{0}")
    public Role findRoleById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("role:id:{0:id}||role:all")
    @CacheDeleteAll("role:username||menu:username")
    public void updateRole(Role role) {
        myMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("menu:role:{0}")
    @CacheDeleteAll("menu:username")
    public void updateRoleMenus(String code, String menuCodes) {
        deleteRoleMenus(code);

        if (StringUtils.isNotEmpty(menuCodes)) {
            roleMapper.insertRoleMenus(code, Arrays.asList(menuCodes.split(",")));
        }
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @CacheDelete("role:id:{0:id}||role:all")
    @CacheDeleteAll("role:username||menu:username")
    public void deleteRoleById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }

    /**
     * 删除角色菜单
     *
     * @param code
     */
    private void deleteRoleMenus(String code) {
        roleMapper.deleteRoleMenus(code);
    }
}
