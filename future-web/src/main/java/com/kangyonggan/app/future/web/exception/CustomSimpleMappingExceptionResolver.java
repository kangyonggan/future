package com.kangyonggan.app.future.web.exception;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author kangyonggan
 * @since 16/9/25
 */
@Log4j2
public class CustomSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver {

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        log.error("控制器异常", ex);
        String viewName = determineViewName(ex, request);
        if (viewName != null) {
            return getModelAndView(viewName, ex, request);
        } else {
            return new ModelAndView("500");
        }
    }
}
