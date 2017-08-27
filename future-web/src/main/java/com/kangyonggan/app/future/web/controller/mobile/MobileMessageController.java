package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.MessageService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.CommonResponse;
import com.kangyonggan.app.future.model.dto.CountResponse;
import com.kangyonggan.app.future.model.dto.MessagesResponse;
import com.kangyonggan.app.future.model.vo.Message;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * 查询消息
     *
     * @param id
     * @param username
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public CommonResponse getMessage(@RequestParam("id") Long id, @RequestParam("username") String username) {
        CommonResponse response = new CommonResponse();

        try {
            // 把消息更新为已读
            messageService.updateMessageUser4Read(id, username);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("查询消息异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

}
