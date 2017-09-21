package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.DemoService;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Demo;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/21 0021
 */
@Service
public class DemoServiceImpl extends BaseService<Demo> implements DemoService {

    @Override
    public List<Demo> searchDemo() {
        Example example = new Example(Demo.class);

        example.setOrderByClause("id desc");

        PageHelper.startPage(1, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    public Demo getDemo(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }
}
