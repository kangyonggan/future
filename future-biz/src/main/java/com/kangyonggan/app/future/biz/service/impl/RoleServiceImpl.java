package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.RoleService;
import com.kangyonggan.app.future.mapper.RoleMapper;
import com.kangyonggan.app.future.model.annotation.CacheGetOrSave;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    @LogTime
    @CacheGetOrSave("role:username:{0}")
    public List<Role> findRolesByUsername(String username) {
        return roleMapper.selectRolesByUsername(username);
    }

    @Override
    public boolean existsRoleCode(String code) {
        return false;
    }

    @Override
    @LogTime
    @CacheGetOrSave("role:all")
    public List<Role> findAllRoles() {
        Role role = new Role();
        role.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.select(role);
    }

    @Override
    public List<Role> searchRoles(int pageNum, String code, String name) {
        return null;
    }

    @Override
    public void saveRole(Role role) {

    }

    @Override
    public Role findRoleById(Long id) {
        return null;
    }

    @Override
    public void updateRole(Role role) {

    }

    @Override
    public void updateRoleMenus(String code, String menuCodes) {

    }
}
