package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Demo;

import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/21 0021
 */
public interface DemoService {

    List<Demo> searchDemo();

    Demo getDemo(Long id);

}
