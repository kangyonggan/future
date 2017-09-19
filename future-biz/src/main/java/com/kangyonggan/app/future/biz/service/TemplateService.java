package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Template;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
public interface TemplateService {

    /**
     * 查找模板分类
     *
     * @param username
     * @return
     */
    List<String> findTypes(String username);

    /**
     * 搜索模板
     *
     * @param pageNum
     * @param name
     * @param type
     * @param username
     * @return
     */
    List<Template> searchTemplates(int pageNum, String name, String type, String username);

    /**
     * 保存模板
     *
     * @param template
     */
    void saveTemplate(Template template) throws Exception;

    /**
     * 查找模板
     *
     * @param id
     * @return
     */
    Template findTempateById(Long id);

    /**
     * 更新模板
     *
     * @param template
     */
    void updateTemplate(Template template) throws Exception;

    /**
     * 删除模板
     *
     * @param id
     */
    void deleteTemplateById(Long id);

    /**
     * 代码生成
     *
     * @param name
     * @param dataSource
     * @return
     */
    String generate(String name, String dataSource);
}
