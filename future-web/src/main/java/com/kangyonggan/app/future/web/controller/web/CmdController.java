package com.kangyonggan.app.future.web.controller.web;

import com.kangyonggan.app.future.biz.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
@RestController
@RequestMapping("cmd")
public class CmdController {

    @Autowired
    private BookService bookService;

    /**
     * 更新书籍
     *
     * @return
     */
    @RequestMapping(value = "book/update", method = RequestMethod.GET)
    public String updateBooks() {
        new Thread() {
            public void run() {
                bookService.updateBooksByCode();
            }
        }.start();
        return "ok";
    }

}
