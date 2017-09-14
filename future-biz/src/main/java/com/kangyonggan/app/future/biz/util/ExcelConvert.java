package com.kangyonggan.app.future.biz.util;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.log4j.Log4j2;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 9/14/17
 */
@Log4j2
public class ExcelConvert {

    /**
     * 按模板转换excel的内容
     *
     * @param templateSource
     * @param sheets
     * @return
     */
    public static String process(String templateSource, List<List<String[]>> sheets) {
        Configuration cfg = new Configuration();
        StringTemplateLoader templateLoader = new StringTemplateLoader();
        templateLoader.putTemplate("template", templateSource);

        cfg.setTemplateLoader(templateLoader);

        try {
            Template template = cfg.getTemplate("template", "UTF-8");
            Map<String, Object> root = new HashMap();
            root.put("sheets", sheets);

            StringWriter writer = new StringWriter();
            template.process(root, writer);

            return writer.toString();
        } catch (Exception e) {
            log.warn("转换出错", e);
            return e.getLocalizedMessage();
        }
    }

}
