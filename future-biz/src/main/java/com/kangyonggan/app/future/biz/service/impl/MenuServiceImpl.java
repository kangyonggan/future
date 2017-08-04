package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.MenuService;
import com.kangyonggan.app.future.model.vo.Menu;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
@Service
public class MenuServiceImpl extends BaseService<Menu> implements MenuService {

    @Override
    public List<Menu> findMenusByUsername(String username) {
        return null;
    }

    @Override
    public List<Menu> findMenus4Role(String code) {
        return null;
    }

    @Override
    public boolean existsMenuCode(String code) {
        return false;
    }

    @Override
    public List<Menu> findAllMenus() {
        return null;
    }

    @Override
    public Menu findMenuByCode(String code) {
        return null;
    }

    @Override
    public void saveMenu(Menu menu) {

    }

    @Override
    public Menu findMenuById(Long id) {
        return null;
    }

    @Override
    public void updateMenu(Menu menu) {

    }

    @Override
    public void deleteMenu(Menu menu) {

    }
}
