package com.kangyonggan.app.future.biz.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.CodeService;
import com.kangyonggan.app.future.biz.service.TableService;
import com.kangyonggan.app.future.common.util.FileUtil;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.dto.Step1;
import com.kangyonggan.app.future.model.dto.Step2;
import com.kangyonggan.app.future.model.dto.Step3;
import com.kangyonggan.app.future.model.vo.Code;
import com.kangyonggan.app.future.model.vo.DbColumn;
import com.kangyonggan.app.future.model.vo.DbTable;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.io.File;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 2017/9/24 0024
 */
@Service
@Log4j2
public class CodeServiceImpl extends BaseService<Code> implements CodeService {

    @Autowired
    private TableService tableService;

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

    @Override
    @LogTime
    public void generateCode(Long id) {
        Code code = myMapper.selectByPrimaryKey(id);

        // 生成Model.java、Mapper.java、Mapper.xml
        generateMBG(code);

        // TODO 生成Service.java
        // TODO 生成ServiceImpl.java
        // TODO 生成Controller.java
        // TODO 生成list.ftl及包含的ftl和对应的js
        // TODO 生成form-model.ftl及包含的ftl和对应的js
        // TODO 生成detail-model.ftl及包含的ftl和对应的js
    }

    /**
     * 生成MBG
     *
     * @param code
     */
    private void generateMBG(Code code) {
        DbTable table = tableService.findTableByName(code.getTableName());
        List<DbColumn> columns = tableService.findTableColumns(code.getTableName());
        try {
            String tableName = code.getTableName();
            log.info("正在生成{}表对应的MBG", tableName);

            // 获取项目路径及项目名
            String bizDir = System.getProperty("user.dir");
            String baseBir = bizDir.substring(0, bizDir.lastIndexOf("/"));
            String appName = bizDir.substring(bizDir.lastIndexOf("/"), bizDir.lastIndexOf("-"));

            // 获取mbg的配置文件
            String generatorConfigPath = baseBir + appName + "-dao/src/main/resources/generatorConfig.xml";
            log.info("generatorConfig配置文件路径：{}", generatorConfigPath);

            // 读取mbg配置文件中的包路径，以便写文件
            SAXReader reader = new SAXReader();
            Document doc = reader.read(new File(generatorConfigPath));
            Element context = doc.getRootElement().element("context");
            String modelPackage = context.element("javaModelGenerator").attributeValue("targetPackage");
            log.info("Model.java的包名为：{}", modelPackage);
            String mapperXmlPackage = context.element("sqlMapGenerator").attributeValue("targetPackage");
            log.info("Mapper.xml的包名为：{}", mapperXmlPackage);
            String mapperPackage = context.element("javaClientGenerator").attributeValue("targetPackage");
            log.info("Mapper.java的包名为：{}", mapperPackage);

            // 生成Model.java
            Map<String, Object> modelMap = new HashMap();
            String modelName = StringUtil.convertTableName(code.getTableName());
            modelMap.put("modelName", modelName);
            modelMap.put("modelPackage", modelPackage);
            modelMap.put("code", code);
            modelMap.put("table", table);
            modelMap.put("columns", columns);
            String modelContent = generate("Model.java.ftl", modelMap);
            modelName = baseBir + appName + "-model/src/main/java/" + modelPackage.replaceAll("\\.", "/") + "/" + modelName + ".java";
            FileUtil.writeTextToFile(modelName, modelContent);
            log.info("{}已经生成完毕", modelName);
        } catch (Exception e) {
            log.warn("生成MBG异常", e);
        }
    }

    /**
     * 代码生成
     *
     * @param templateName
     * @param root
     * @return
     * @throws Exception
     */
    private String generate(String templateName, Map<String, Object> root) throws Exception {
        Configuration cfg = new Configuration();
        cfg.setClassForTemplateLoading(this.getClass(), "/templates");
        Template template = cfg.getTemplate(templateName, "UTF-8");

        StringWriter writer = new StringWriter();

        template.process(root, writer);
        return writer.toString();
    }
}
