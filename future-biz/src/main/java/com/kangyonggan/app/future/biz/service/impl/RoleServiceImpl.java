package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.RoleService;
import com.kangyonggan.app.future.model.vo.Role;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
@Service
public class RoleServiceImpl extends BaseService<Role> implements RoleService {

    @Override
    public List<Role> findRolesByUsername(String username) {
        return null;
    }

    @Override
    public boolean existsRoleCode(String code) {
        return false;
    }

    @Override
    public List<Role> findAllRoles() {
        return null;
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
