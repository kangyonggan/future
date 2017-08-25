package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.CategoriesResponse;
import com.kangyonggan.app.future.model.vo.Category;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/24/17
 */
@RestController
@RequestMapping("mobile/category")
@Log4j2
public class MobileCategoryController {

    @Autowired
    private BookService bookService;

    /**
     * 查找所有分类
     *
     * @return
     */
    @RequestMapping(value = "all", method = RequestMethod.POST)
    public CategoriesResponse categories() {
        CategoriesResponse response = new CategoriesResponse();

        try {
            List<Category> categories = bookService.findAllCategoryWithBookCount();
            response.setCategories(categories);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("查询小说全部分类异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }
}
