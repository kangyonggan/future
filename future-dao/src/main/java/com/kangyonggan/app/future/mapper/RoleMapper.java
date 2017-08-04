package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleMapper extends MyMapper<Role> {

    /**
     * 查找用户角色
     *
     * @param username
     * @return
     */
    List<Role> selectRolesByUsername(@Param("username") String username);

    /**
     * 删除用户所有角色
     *
     * @param username
     */
    void deleteAllRolesByUsername(@Param("username") String username);
}