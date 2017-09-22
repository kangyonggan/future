package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.DemoService;
import com.kangyonggan.app.future.mapper.DemoMapper;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Demo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 2017/9/21 0021
 */
@Service
public class DemoServiceImpl extends BaseService<Demo> implements DemoService {

    @Autowired
    private DemoMapper demoMapper;

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