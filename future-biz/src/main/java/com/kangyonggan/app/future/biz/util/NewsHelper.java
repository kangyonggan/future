package com.kangyonggan.app.future.biz.util;

import com.alibaba.fastjson.JSONObject;
import com.kangyonggan.app.future.model.constants.AppConstants;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import java.io.FileReader;
import java.io.IOException;

/**
 * @author kangyonggan
 * @since 9/1/17
 */
@Component
@Log4j2
public class NewsHelper {

    public static void main(String[] args) {
        System.out.println(getUrlParam().get("as"));
        System.out.println(getUrlParam().get("cp"));
    }

    /**
     * 执行js获取as和cp参数值
     *
     * @return
     */
    public static JSONObject getUrlParam() {
        JSONObject jsonObject = null;
        FileReader reader = null;
        try {
            ScriptEngineManager manager = new ScriptEngineManager();
            ScriptEngine engine = manager.getEngineByName("javascript");

            String jsFileName = PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + "static/app/js/mobile/news.js"; // 读取js文件

            reader = new FileReader(jsFileName); // 执行指定脚本
            engine.eval(reader);

            if (engine instanceof Invocable) {
                Invocable invoke = (Invocable) engine;
                Object obj = invoke.invokeFunction("getParam");
                jsonObject = JSONObject.parseObject(obj != null ? obj
                        .toString() : null);
            }
        } catch (Exception e) {
            log.warn("执行js异常", e);
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                log.warn("关闭流异常", e);
            }
        }
        return jsonObject;
    }
}
