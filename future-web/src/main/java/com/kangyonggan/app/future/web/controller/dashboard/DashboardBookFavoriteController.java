package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.biz.service.SectionService;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.app.future.model.vo.Section;
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
@RequestMapping("dashboard/book/favorite")
public class DashboardBookFavoriteController extends BaseController {

    @Autowired
    private BookService bookService;

    /**
     * 收藏列表
     *
     * @param pageNum
     * @param username
     * @param bookCode
     * @param bookName
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("BOOK_FAVORITE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "username", required = false, defaultValue = "") String username,
                       @RequestParam(value = "bookCode", required = false, defaultValue = "") String bookCode,
                       @RequestParam(value = "bookName", required = false, defaultValue = "") String bookName,
                       Model model) {
        List<Book> books = bookService.searchFavoriteBooks(pageNum, username, bookCode, bookName);
        PageInfo<Book> page = new PageInfo(books);

        model.addAttribute("page", page);
        return getPathList();
    }
}
