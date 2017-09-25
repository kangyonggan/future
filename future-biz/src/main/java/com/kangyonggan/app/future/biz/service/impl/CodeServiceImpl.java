package com.kangyonggan.app.future.biz.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.CodeService;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.dto.Step1;
import com.kangyonggan.app.future.model.dto.Step2;
import com.kangyonggan.app.future.model.dto.Step3;
import com.kangyonggan.app.future.model.vo.Code;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/24 0024
 */
@Service
public class CodeServiceImpl extends BaseService<Code> implements CodeService {

    @Override
    @LogTime
    public List<Code> searchCodes(int pageNum, String tableName, String menuName) {
        Example example = new Example(Code.class);

        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(tableName)) {
            criteria.andEqualTo("tableName", tableName);
        }
        if (StringUtils.isNotEmpty(menuName)) {
            criteria.andEqualTo("menuName", menuName);
        }

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public void saveCode(Code code) {
        myMapper.insertSelective(code);
    }

    @Override
    @LogTime
    public Code findCodeById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @LogTime
    public void updateStep1(Step1 step1) {
        Code code = new Code();
        code.setId(step1.getCodeId());
        code.setStep1(JSON.toJSONString(step1));

        myMapper.updateByPrimaryKeySelective(code);
    }

    @Override
    @LogTime
    public void updateStep2(Step2 step2) {
        Code code = new Code();
        code.setId(step2.getCodeId());
        code.setStep2(JSON.toJSONString(step2));

        myMapper.updateByPrimaryKeySelective(code);
    }

    @Override
    @LogTime
    public void updateStep3(Step3 step3) {
        Code code = new Code();
        code.setId(step3.getCodeId());
        code.setStep3(JSON.toJSONString(step3));

        myMapper.updateByPrimaryKeySelective(code);
    }

    @Override
    @LogTime
    public void updateCode(Code code) {
        myMapper.updateByPrimaryKeySelective(code);
    }
}
