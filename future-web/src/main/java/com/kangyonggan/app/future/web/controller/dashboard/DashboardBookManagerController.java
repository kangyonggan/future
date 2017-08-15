package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
@Controller
@RequestMapping("dashboard/book/manager")
public class DashboardBookManagerController extends BaseController {

    @Autowired
    private BookService bookService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 小说列表
     *
     * @param pageNum
     * @param bookCode
     * @param bookName
     * @param author
     * @param categoryCode
     * @param isFinished
     * @param isHot
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("BOOK_MANAGER")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "bookCode", required = false, defaultValue = "") String bookCode,
                       @RequestParam(value = "bookName", required = false, defaultValue = "") String bookName,
                       @RequestParam(value = "author", required = false, defaultValue = "") String author,
                       @RequestParam(value = "categoryCode", required = false, defaultValue = "") String categoryCode,
                       @RequestParam(value = "isFinished", required = false, defaultValue = "") String isFinished,
                       @RequestParam(value = "isHot", required = false, defaultValue = "") String isHot,
                       Model model) {
        List<Book> books = bookService.searchBooks(pageNum, bookCode, bookName, author, categoryCode, isFinished, isHot);
        PageInfo<Book> page = new PageInfo(books);
        List<Category> categories = categoryService.findCategoriesByType(CategoryType.BOOK.getType());

        model.addAttribute("page", page);
        model.addAttribute("categories", categories);
        return getPathList();
    }

    /**
     * 抓取书籍
     *
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.GET)
    @RequiresPermissions("BOOK_MANAGER")
    @ResponseBody
    public Map<String, Object> update() {
        Book book = bookService.findLastBook();

        new Thread() {
            @Override
            public void run() {
                bookService.updateBooksByCode(book.getCode());
            }
        }.start();
        return getResultMap();
    }

    /**
     * 推荐/取消
     *
     * @param code
     * @param isHot
     * @param model
     * @return
     */
    @RequestMapping(value = "{code:[\\d]+}/{isHot:\\bhot\\b|\\bunhot\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("BOOK_MANAGER")
    public String delete(@PathVariable("code") int code, @PathVariable("isHot") String isHot, Model model) {
        Book book = bookService.findBookByCode(code);
        List<Category> categories = categoryService.findCategoriesByType(CategoryType.BOOK.getType());

        book.setIsHot((byte) (isHot.equals("hot") ? 1 : 0));
        bookService.updateBook(book);

        model.addAttribute("book", book);
        model.addAttribute("categories", categories);
        return getPathTableTr();
    }

}
