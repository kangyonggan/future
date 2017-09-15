package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.GuestbookService;
import com.kangyonggan.app.future.biz.service.MailService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.vo.Guestbook;
import com.kangyonggan.app.future.model.vo.ShiroUser;
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
 * @since 9/1/17
 */
@Controller
@RequestMapping("dashboard/web/guestbook")
public class DashboardWebGuestbookController extends BaseController {

    @Autowired
    private GuestbookService guestbookService;

    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    /**
     * 留言列表
     *
     * @param pageNum
     * @param status
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "status", required = false, defaultValue = "") String status,
                       Model model) {
        List<Guestbook> guestbooks = guestbookService.searchGuestbook(pageNum, status);
        PageInfo<Guestbook> page = new PageInfo(guestbooks);

        model.addAttribute("page", page);
        model.addAttribute("articleStatus", ArticleStatus.values());
        return getPathList();
    }


    /**
     * 删除/恢复
     *
     * @param id
     * @param isDeleted
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{isDeleted:\\bundelete\\b|\\bdelete\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        Guestbook guestbook = guestbookService.findGuestbookById(id);
        guestbook.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
        guestbookService.updateGuestbook(guestbook);

        model.addAttribute("guestbook", guestbook);
        return getPathTableTr();
    }

    /**
     * 审核通过/审核不通过
     *
     * @param id
     * @param status
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{status:\\bcomplete\\b|\\breject\\b|\\bwaiting\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String status(@PathVariable("id") Long id, @PathVariable("status") String status, Model model) {
        ShiroUser shiroUser = userService.getShiroUser();
        Guestbook guestbook = guestbookService.findGuestbookById(id);

        guestbook.setStatus(status);
        guestbook.setAdjustUsername(shiroUser.getUsername());
        guestbookService.updateGuestbook(guestbook);

        model.addAttribute("guestbook", guestbook);
        return getPathTableTr();
    }

    /**
     * 查看详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String detail(@PathVariable("id") Long id, Model model) {
        Guestbook guestbook = guestbookService.findGuestbookById(id);

        guestbook.setReplyMessage(MarkdownUtil.markdownToHtml(guestbook.getReplyMessage()));

        model.addAttribute("guestbook", guestbook);
        return getPathDetail();
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/remove", method = RequestMethod.GET)
    @RequiresPermissions("WEB_GUESTBOOK")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        guestbookService.deleteGuestbookById(id);
        return super.getResultMap();
    }

    /**
     * 上一个
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/prev", method = RequestMethod.GET)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String prev(@PathVariable("id") Long id, Model model) {
        Guestbook guestbook = guestbookService.findPrevGuestbook(id);
        if (guestbook == null) {
            model.addAttribute("message", "这已经是第一个留言了");
            model.addAttribute("id", id);
            return getPathRoot() + "/no-guestbook";
        }

        guestbook.setReplyMessage(MarkdownUtil.markdownToHtml(guestbook.getReplyMessage()));

        model.addAttribute("guestbook", guestbook);
        return getPathDetail();
    }

    /**
     * 下一个
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/next", method = RequestMethod.GET)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String next(@PathVariable("id") Long id, Model model) {
        Guestbook guestbook = guestbookService.findNextGuestbook(id);
        if (guestbook == null) {
            model.addAttribute("message", "这已经是最后一个留言了");
            model.addAttribute("id", id);
            return getPathRoot() + "/no-guestbook";
        }

        guestbook.setReplyMessage(MarkdownUtil.markdownToHtml(guestbook.getReplyMessage()));

        model.addAttribute("guestbook", guestbook);
        return getPathDetail();
    }

    /**
     * 回复
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/reply", method = RequestMethod.GET)
    @RequiresPermissions("WEB_GUESTBOOK")
    public String reply(@PathVariable("id") Long id, Model model) {
        model.addAttribute("id", id);
        return getPathRoot() + "/reply-modal";
    }

    /**
     * 回复
     *
     * @param id
     * @param replyMessage
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/reply", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("WEB_GUESTBOOK")
    public Map<String, Object> reply(@PathVariable("id") Long id, @RequestParam("replyMessage") String replyMessage) {
        ShiroUser shiroUser = userService.getShiroUser();

        Guestbook guestbook = guestbookService.findGuestbookById(id);
        guestbook.setReplyMessage(replyMessage);
        guestbook.setReplyUsername(shiroUser.getUsername());

        guestbookService.updateGuestbook(guestbook);

        replyMessage += "\n\n---\n\n地址：[https://kangyonggan.com/#guestbook](https://kangyonggan.com/#guestbook)";

        // 发邮件通知
        mailService.send(guestbook.getEmail(), "未来网站的站长回复了您的留言", MarkdownUtil.markdownToHtml(replyMessage));

        return getResultMap();
    }

}
