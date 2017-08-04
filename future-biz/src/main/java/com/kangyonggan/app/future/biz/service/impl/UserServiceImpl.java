package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.model.vo.User;
import org.springframework.stereotype.Service;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
@Service
public class UserServiceImpl extends BaseService<User> implements UserService {

    @Override
    public User findUserByUsername(String username) {
        return null;
    }
}
