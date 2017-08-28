package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.MessageService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.Collections3;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.model.constants.MessageType;
import com.kangyonggan.app.future.model.vo.Message;
import com.kangyonggan.app.future.model.vo.ShiroUser;
import com.kangyonggan.app.future.model.vo.User;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 2017/1/9
 */
@Controller
@RequestMapping("dashboard/system/message")
public class DashboardSystemMessageController extends BaseController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    /**
     * 消息列表
     *
     * @param pageNum
     * @param title
     * @param type
     * @param createdUsername
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_MESSAGE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "title", required = false, defaultValue = "") String title,
                       @RequestParam(value = "type", required = false, defaultValue = "") String type,
                       @RequestParam(value = "createdUsername", required = false, defaultValue = "") String createdUsername,
                       Model model) {
        List<Message> messages = messageService.searchMessages(pageNum, title, type, createdUsername);
        PageInfo<Message> page = new PageInfo(messages);

        model.addAttribute("page", page);
        model.addAttribute("types", MessageType.values());
        return getPathList();
    }

    /**
     * 发布消息
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_MESSAGE")
    public String create(Model model) {
        Message message = new Message();
        message.setIsGroup((byte) 1);
        message.setType(MessageType.SYSTEM.getType());

        List<User> users = userService.findAllUsers();

        model.addAttribute("message", message);
        model.addAttribute("users", users);
        model.addAttribute("types", MessageType.values());
        return getPathForm();
    }

    /**
     * 保存
     *
     * @param message
     * @param result
     * @param usernames
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("SYSTEM_MESSAGE")
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("message") @Valid Message message, BindingResult result,
                                    @RequestParam(value = "usernames", required = false, defaultValue = "") String usernames) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            ShiroUser shiroUser = userService.getShiroUser();
            message.setCreatedUsername(shiroUser.getUsername());
            messageService.save(message, usernames);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
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
    @RequiresPermissions("SYSTEM_MESSAGE")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        Message message = messageService.findMessageById(id);
        message.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
        messageService.updateMessage(message);

        model.addAttribute("message", message);
        model.addAttribute("types", MessageType.values());
        return getPathTableTr();
    }

    /**
     * 详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_MESSAGE")
    public String detail(@PathVariable("id") Long id, Model model) {
        // 更新消息为已读
        messageService.updateMessageUser4Read(id, userService.getShiroUser().getUsername());

        Message message = messageService.findMessageById(id);
        message.setContent(MarkdownUtil.markdownToHtml(message.getContent()));

        Message replyMessage = messageService.findReplyMessage(id);
        if (replyMessage != null) {
            replyMessage.setContent(MarkdownUtil.markdownToHtml(replyMessage.getContent()));
        }

        List<User> users = userService.findMessageUsers(id);

        model.addAttribute("message", message);
        model.addAttribute("replyMessage", replyMessage);
        model.addAttribute("users", users);
        model.addAttribute("user", userService.getShiroUser());
        model.addAttribute("usernames", Collections3.extractToList(users, "username"));
        model.addAttribute("types", MessageType.values());
        return getPathDetail();
    }

    /**
     * 编辑
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/edit", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_MESSAGE")
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("message", messageService.findMessageById(id));
        model.addAttribute("types", MessageType.values());
        return getPathForm();
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/remove", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_MESSAGE")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        messageService.deleteMessageById(id);
        return super.getResultMap();
    }

    /**
     * 更新
     *
     * @param message
     * @param result
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @RequiresPermissions("SYSTEM_MESSAGE")
    @ResponseBody
    public Map<String, Object> update(@ModelAttribute("message") @Valid Message message, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            messageService.updateMessage(message);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 回复
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/reply", method = RequestMethod.GET)
    public String reply(@PathVariable("id") Long id, Model model) {
        model.addAttribute("id", id);
        return getPathRoot() + "/reply-modal";
    }

    /**
     * 回复
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/reply", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> reply(@PathVariable("id") Long id, @RequestParam("content") String content) {
        ShiroUser shiroUser = userService.getShiroUser();

        Message msg = messageService.findAbleMessageById(id);

        Message message = new Message();
        message.setCreatedUsername(shiroUser.getUsername());
        message.setType(MessageType.REPLY.getType());
        message.setTitle("系统回复了你提出的意见反馈");
        message.setContent(content);
        message.setIsGroup((byte) 0);

        // 回复
        messageService.save(message, msg.getCreatedUsername());

        // 更新回复状态
        messageService.updateMessageUser4Reply(id, shiroUser.getUsername(), message.getId());

        return getResultMap();
    }
}
