package com.kangyonggan.app.future.web.controller.mobile;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.FindAllCategoryResponse;
import com.kangyonggan.app.future.model.dto.FindHotBookResponse;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
@RestController
@RequestMapping("m/book")
@Log4j2
public class MBookController {

    @Autowired
    private BookService bookService;

    /**
     * 查找所有小说分类
     *
     * @return
     */
    @RequestMapping(value = "findAllCategory", method = RequestMethod.POST)
    public FindAllCategoryResponse findAllCategory() {
        FindAllCategoryResponse response = new FindAllCategoryResponse();

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

    /**
     * 查找推荐小说
     *
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "findHotBook", method = RequestMethod.POST)
    public FindHotBookResponse findHotBook(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum) {
        FindHotBookResponse response = new FindHotBookResponse();

        try {
            List<Book> books = bookService.findHotBooks(pageNum);
            PageInfo<Book> page = new PageInfo(books);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());

            response.setTotal(page.getTotal());
            response.setPages(page.getPages());
            response.setBooks(books);
        } catch (Exception e) {
            log.warn("查找推荐小说异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

}
