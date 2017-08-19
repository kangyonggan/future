package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.FavoriteService;
import com.kangyonggan.app.future.biz.service.SectionService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.*;
import com.kangyonggan.app.future.model.vo.Book;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.app.future.model.vo.Favorite;
import com.kangyonggan.app.future.model.vo.Section;
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

    @Autowired
    private SectionService sectionService;

    @Autowired
    private FavoriteService favoriteService;

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
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "findHotBook", method = RequestMethod.POST)
    public FindHotBookResponse findHotBook(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                                           @RequestParam("pageSize") int pageSize) {
        FindHotBookResponse response = new FindHotBookResponse();

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
     * 查找小说章节
     *
     * @param code    小说代码
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "findBookSections", method = RequestMethod.POST)
    public FindBookSectionsResponse findBookSections(@RequestParam("code") int code,
                                                     @RequestParam(value = "p", required = false, defaultValue = "1") int pageNum) {
        FindBookSectionsResponse response = new FindBookSectionsResponse();

        try {
            List<Section> sections = sectionService.findBookSections(code, pageNum);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());

            response.setSections(sections);
        } catch (Exception e) {
            log.warn("查找小说章节异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查找小说章节
     *
     * @param code 章节代码
     * @return
     */
    @RequestMapping(value = "findBookSection", method = RequestMethod.POST)
    public FindBookSectionResponse findBookSection(@RequestParam("code") int code) {
        FindBookSectionResponse response = new FindBookSectionResponse();

        try {
            Section section = sectionService.findSectionByCode(code);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
            response.setSection(section);
        } catch (Exception e) {
            log.warn("查找小说章节异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 添加我的收藏
     *
     * @param username
     * @param bookCode
     * @return
     */
    @RequestMapping(value = "addFavorite", method = RequestMethod.POST)
    public CommonResponse addFavorite(@RequestParam("username") String username, @RequestParam("bookCode") int bookCode) {
        CommonResponse response = new CommonResponse();

        try {
            Book book = bookService.findBookByCode(bookCode);

            Favorite favorite = new Favorite();
            favorite.setBookCode(bookCode);
            favorite.setUsername(username);
            favorite.setBookName(book.getName());

            favoriteService.saveFavorite(favorite);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("添加我的收藏异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 取消我的收藏
     *
     * @param username
     * @param bookCode
     * @return
     */
    @RequestMapping(value = "removeFavorite", method = RequestMethod.POST)
    public CommonResponse removeFavorite(@RequestParam("username") String username, int bookCode) {
        CommonResponse response = new CommonResponse();

        try {
            favoriteService.deleteFavorite(username, bookCode);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("取消我的收藏异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查找我的收藏
     *
     * @param pageNum
     * @param pageSize
     * @param username
     * @return
     */
    @RequestMapping(value = "findFavorites", method = RequestMethod.POST)
    public FindFavoritesResponse findFavorites(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                                               @RequestParam("pageSize") int pageSize,
                                               @RequestParam("username") String username) {
        FindFavoritesResponse response = new FindFavoritesResponse();

        try {
            List<Favorite> favorites = favoriteService.findFavoritesByUsername(pageNum, pageSize, username);

            response.setFavorites(favorites);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("查找我的收藏异常", e);
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
    @RequestMapping(value = "searchBooks", method = RequestMethod.POST)
    public SearchBooksResponse searchBooks(@RequestParam("key") String key) {
        try {
            key = new String(key.getBytes("ISO-8859-1"), "UTF-8");
            log.info("转码后key:{}", key);
        } catch (Exception e) {
            log.warn("转码异常", e);
        }

        SearchBooksResponse response = new SearchBooksResponse();

        try {
            List<Book> books = bookService.searchBooks(key);

            response.setBooks(books);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("更新最后阅读的章节异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查找小说章节
     *
     * @param username
     * @param bookCode
     * @return
     */
    @RequestMapping(value = "lastSection", method = RequestMethod.POST)
    public SectionResponse lastSection(@RequestParam("username") String username, @RequestParam("bookCode") int bookCode) {
        SectionResponse response = new SectionResponse();

        try {
            Section section;
            Favorite favorite = favoriteService.findFavorite(username, bookCode);
            if (favorite == null) {
                // 查找第一章
                section = sectionService.findBookFirstSection(bookCode);
            } else {
                section = sectionService.findSectionByCode(favorite.getLastSectionCode());
            }

            if (section == null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("没有此小说的章节");
                return response;
            }

            response.setSection(section);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("查找小说章节异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查找小说章节
     *
     * @param username
     * @param sectionCode
     * @return
     */
    @RequestMapping(value = "section", method = RequestMethod.POST)
    public SectionResponse section(@RequestParam("username") String username, @RequestParam("sectionCode") int sectionCode) {
        SectionResponse response = new SectionResponse();

        try {
            Section section = sectionService.findSectionByCode(sectionCode);

            if (section == null) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("不存在的章节");
                return response;
            }

            favoriteService.updateFavoriteLastSection(username, section.getBookCode(), section.getCode(), section.getTitle());

            response.setSection(section);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("查找小说章节异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }
}
