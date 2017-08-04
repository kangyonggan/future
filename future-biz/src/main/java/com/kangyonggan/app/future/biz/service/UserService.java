package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.User;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
public interface UserService {

    /**
     * 根据用户名查找用户
     *
     * @param username
     * @return
     */
    User findUserByUsername(String username);
}
