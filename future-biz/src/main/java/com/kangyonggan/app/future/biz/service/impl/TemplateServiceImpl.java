package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.TemplateService;
import com.kangyonggan.app.future.common.util.Collections3;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Template;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
@Service
public class TemplateServiceImpl extends BaseService<Template> implements TemplateService {

    @Override
    @LogTime
    public List<String> findTypes(String username) {
        Example example = new Example(Template.class);

        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(username)) {
            criteria.andEqualTo("username", username);
        }

        example.setDistinct(true);
        example.selectProperties("type");
        example.setOrderByClause("type desc");

        List<Template> templates = myMapper.selectByExample(example);
        return Collections3.extractToList(templates, "type");
    }

    @Override
    @LogTime
    public List<Template> searchTemplates(int pageNum, String name, String type, String username) {
        Example example = new Example(Template.class);

        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(name)) {
            criteria.andEqualTo("name", name);
        }
        if (StringUtils.isNotEmpty(type)) {
            criteria.andEqualTo("type", type);
        }
        if (StringUtils.isNotEmpty(username)) {
            criteria.andEqualTo("username", username);
        }

        example.selectProperties("id, name, type, description, isDeleted, createdTime, updatedTime");
        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }
}
