package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.MessageService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.Collections3;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.model.constants.MessageType;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.CommonResponse;
import com.kangyonggan.app.future.model.dto.CountResponse;
import com.kangyonggan.app.future.model.dto.MessageResponse;
import com.kangyonggan.app.future.model.dto.MessagesResponse;
import com.kangyonggan.app.future.model.vo.Message;
import com.kangyonggan.app.future.model.vo.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
@Controller
@RequestMapping("mobile/message")
@Log4j2
public class MobileMessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    /**
     * 查询未读消息数量
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "count", method = RequestMethod.POST)
    @ResponseBody
    public CountResponse getMessageCount(@RequestParam("username") String username) {
        CountResponse response = new CountResponse();

        try {
            int count = messageService.findMessageCount(username);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());

            response.setCount(count);
        } catch (Exception e) {
            log.warn("查询未读消息数量异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查询所有消息
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "all", method = RequestMethod.POST)
    @ResponseBody
    public MessagesResponse getAllMessages(@RequestParam("username") String username) {
        MessagesResponse response = new MessagesResponse();

        try {
            List<Message> messages = messageService.findMessagesByUsername(username);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());

            response.setMessages(messages);
        } catch (Exception e) {
            log.warn("查询所有消息异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 消息更新为已读
     *
     * @param id
     * @param username
     * @return
     */
    @RequestMapping(value = "read", method = RequestMethod.POST)
    @ResponseBody
    public CommonResponse messageRead(@RequestParam("id") Long id, @RequestParam("username") String username) {
        CommonResponse response = new CommonResponse();

        try {
            // 把消息更新为已读
            messageService.updateMessageUser4Read(id, username);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("消息更新为已读异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 消息全部标记为已读
     *
     * @param username
     * @return
     */
    @RequestMapping(value = "allread", method = RequestMethod.POST)
    @ResponseBody
    public CommonResponse messageAllRead(@RequestParam("username") String username) {
        CommonResponse response = new CommonResponse();

        try {
            // 把消息全部更新为已读
            messageService.updateMessageUser4Read(username);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("消息全部更新为已读异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 意见反馈
     *
     * @param username
     * @param content
     * @return
     */
    @RequestMapping(value = "advice", method = RequestMethod.POST)
    @ResponseBody
    public CommonResponse advice(@RequestParam("username") String username,
                                 @RequestParam("content") String content) {
        CommonResponse response = new CommonResponse();

        content = StringUtil.decode(content);

        try {
            // 组装意见
            Message message = new Message();
            message.setTitle("收到来自" + username + "的意见反馈");
            message.setContent(content);
            message.setIsGroup((byte) 0);
            message.setCreatedUsername(username);
            message.setType(MessageType.ADVICE.getType());

            // 查询所有管理员
            List<User> users = userService.findAllAdmin();
            messageService.save(message, Collections3.extractToString(users, "username", ","));

            // 告诉反馈者请等待的系统消息
            Message respMsg = new Message();
            respMsg.setType(MessageType.SYSTEM.getType());
            respMsg.setTitle("您的意见反馈已经提交成功了");
            respMsg.setCreatedUsername("SYSTEM");
            respMsg.setContent("我们已经收到了你提交的宝贵意见，我们会在第一时间处理你的反馈意见，处理完成后我们会及时给您回复的。");
            respMsg.setIsGroup((byte) 0);
            messageService.save(respMsg, username);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("意见反馈异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 欲回复意见反馈
     *
     * @param id
     * @param username
     * @return
     */
    @RequestMapping(value = "preReply", method = RequestMethod.POST)
    @ResponseBody
    public MessageResponse preReply(@RequestParam("id") Long id, @RequestParam("username") String username) {
        MessageResponse response = new MessageResponse();

        try {
            Message message = messageService.findAbleMessageById(id);
            message.setContent(MarkdownUtil.markdownToHtml(message.getContent()));

            // 更新消息为已读
            messageService.updateMessageUser4Read(id, username);

            // 查找被回复的内容
            Message replyMessage = messageService.findReplyMessage(id);

            response.setMessage(message);
            response.setReplyMessage(replyMessage);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("欲回复意见反馈异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 回复消息
     *
     * @param messageId
     * @param username
     * @param content
     * @return
     */
    @RequestMapping(value = "reply", method = RequestMethod.POST)
    @ResponseBody
    public CommonResponse reply(@RequestParam("messageId") Long messageId, @RequestParam("username") String username, @RequestParam("content") String content) {
        CommonResponse response = new CommonResponse();

        content = StringUtil.decode(content);

        try {
            Message msg = messageService.findAbleMessageById(messageId);

            Message message = new Message();
            message.setCreatedUsername(username);
            message.setType(MessageType.REPLY.getType());
            message.setTitle("系统回复了你提出的意见反馈");
            message.setContent(content);
            message.setIsGroup((byte) 0);

            // 回复
            messageService.save(message, msg.getCreatedUsername());

            // 更新回复状态
            messageService.updateMessageUser4Reply(messageId, username, message.getId());

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("回复消息异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

    /**
     * 查看消息
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    public String messageRead(@PathVariable("id") Long id, Model model) {
        Message message = messageService.findAbleMessageById(id);
        message.setContent(MarkdownUtil.markdownToHtml(message.getContent()));

        model.addAttribute("message", message);
        model.addAttribute("types", MessageType.values());
        return "mobile/message/detail";
    }

}
