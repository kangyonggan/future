package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.BooksResponse;
import com.kangyonggan.app.future.model.vo.Book;
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
@RequestMapping("mobile/book")
@Log4j2
public class MobileBookController {

    @Autowired
    private BookService bookService;

    /**
     * 查找推荐小说
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "hots", method = RequestMethod.POST)
    public BooksResponse hots(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                              @RequestParam("pageSize") int pageSize) {
        BooksResponse response = new BooksResponse();

        try {
            List<Book> books = bookService.findHotBooks(pageNum, pageSize);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());

            response.setBooks(books);
        } catch (Exception e) {
            log.warn("查找推荐小说异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 搜索小说
     *
     * @param key
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.POST)
    public BooksResponse search(@RequestParam("key") String key) {
        try {
            key = new String(key.getBytes("ISO-8859-1"), "UTF-8");
            log.info("转码后key:{}", key);
        } catch (Exception e) {
            log.warn("转码异常", e);
        }

        BooksResponse response = new BooksResponse();

        try {
            List<Book> books = bookService.searchBooks(key);

            response.setBooks(books);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("搜索小说异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查找某分类的小说
     *
     * @param pageNum
     * @param categoryCode
     * @return
     */
    @RequestMapping(value = "category", method = RequestMethod.POST)
    public BooksResponse category(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                                  @RequestParam("categoryCode") String categoryCode) {
        BooksResponse response = new BooksResponse();

        try {
            List<Book> books = bookService.findBooksByCategoryCode(pageNum, categoryCode);

            response.setBooks(books);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("查找某分类的小说异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }
}
