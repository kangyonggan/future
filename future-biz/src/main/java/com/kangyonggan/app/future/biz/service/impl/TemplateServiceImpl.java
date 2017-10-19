package com.kangyonggan.app.future.biz.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.TemplateService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.Collections3;
import com.kangyonggan.app.future.common.util.FileUtil;
import com.kangyonggan.app.future.common.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Template;
import com.kangyonggan.methodlogger.MethodLogger;
import freemarker.cache.FileTemplateLoader;
import freemarker.template.Configuration;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.io.File;
import java.io.StringWriter;
import java.util.List;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
@Service
@Log4j2
public class TemplateServiceImpl extends BaseService<Template> implements TemplateService {

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
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
//    @MethodLogger(Log4j2MethodLoggerHandler.class)
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

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public void saveTemplate(Template template) throws Exception {
        template.setDataSource("");
        myMapper.insertSelective(template);

        // 模板写入
        FileUtil.writeTextToFile(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + "downloads/templates/" + template.getName(), template.getTemplate());
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public Template findTemplateById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public void updateTemplate(Template template) throws Exception {
        myMapper.updateByPrimaryKeySelective(template);

        if (StringUtils.isNotEmpty(template.getName()) && StringUtils.isNotEmpty(template.getTemplate())) {
            // 模板写入
            FileUtil.writeTextToFile(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + "downloads/templates/" + template.getName(), template.getTemplate());
        }
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public void deleteTemplateById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public String generate(String name, String dataSource) {
        try {
            Configuration cfg = new Configuration();
            FileTemplateLoader templateLoader = new FileTemplateLoader(new File(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + "downloads/templates"));
            cfg.setTemplateLoader(templateLoader);
            freemarker.template.Template template = cfg.getTemplate(name, "UTF-8");

            JSONObject jsonObject = JSON.parseObject(dataSource);
            StringWriter writer = new StringWriter();

            template.process(jsonObject, writer);
            return writer.toString();
        } catch (Exception e) {
            log.warn("自动生成代码失败", e);
            return e.getLocalizedMessage();
        }
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public boolean existsTemplateName(String name) {
        Template template = new Template();
        template.setName(name);

        return super.exists(template);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public Template findTemplateByName(String name) {
        Template template = new Template();
        template.setIsDeleted(AppConstants.IS_DELETED_NO);
        template.setName(name);

        return myMapper.selectOne(template);
    }

}
