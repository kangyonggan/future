package com.kangyonggan.app.future.biz.util;

import com.kangyonggan.methodlogger.ConsoleMethodLoggerHandler;
import lombok.extern.log4j.Log4j2;

/**
 * @author kangyonggan
 * @since 10/12/17
 */
@Log4j2
public class Log4j2MethodLoggerHandler extends ConsoleMethodLoggerHandler {

    public Log4j2MethodLoggerHandler(String packageName) {
        super(packageName);
    }

    @Override
    public void info(String msg) {
        log.info(msg);
    }
}
