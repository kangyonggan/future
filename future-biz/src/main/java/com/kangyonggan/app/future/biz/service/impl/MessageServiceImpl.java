package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.MessageService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.Collections3;
import com.kangyonggan.app.future.mapper.MessageMapper;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Message;
import com.kangyonggan.app.future.model.vo.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
@Service
public class MessageServiceImpl extends BaseService<Message> implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private UserService userService;

    @Override
    public List<Message> searchMessages(int pageNum, String title, String type, String createdUsername) {
        Example example = new Example(Message.class);
        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(title)) {
            criteria.andEqualTo("title", title);
        }

        if (StringUtils.isNotEmpty(type)) {
            criteria.andEqualTo("type", type);
        }

        if (StringUtils.isNotEmpty(createdUsername)) {
            criteria.andEqualTo("createdUsername", createdUsername);
        }


        example.selectProperties("id", "title", "type", "createdUsername", "createdTime", "isDeleted", "isGroup");
        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public void save(Message message, String usernames) {
        myMapper.insertSelective(message);

        if (message.getIsGroup() == 1) {
            List<User> users = userService.findAllUsers();
            usernames = Collections3.extractToString(users, "username", ",");
        }

        messageMapper.insertMessageUsers(message.getId(), usernames.split(","));
    }

    @Override
    @LogTime
    public Message findMessageById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @LogTime
    public void updateMessage(Message message) {
        myMapper.updateByPrimaryKeySelective(message);
    }

    @Override
    @LogTime
    public void deleteMessageById(Long id) {
        myMapper.deleteByPrimaryKey(id);

        // 删除消息分发表的数据
        messageMapper.deleteMessageUserByMessageId(id);
    }

    @Override
    @LogTime
    public int findMessageCount(String username) {
        return messageMapper.selectMessageCount(username);
    }

    @Override
    @LogTime
    public List<Message> findMessagesByUsername(String username) {
        return messageMapper.selectMessagesByUsername(username);
    }

    @Override
    public void updateMessageUser4Read(Long messageId, String username) {
        messageMapper.updateMessageUser4Read(messageId, username);
    }

    @Override
    public Message findAbleMessageById(Long id) {
        Message message = new Message();
        message.setId(id);
        message.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.selectOne(message);
    }

    @Override
    @LogTime
    public Message findReplyMessage(Long id) {
        return messageMapper.selectReplyMessage(id);
    }

    @Override
    @LogTime
    public void updateMessageUser4Reply(Long id, String username, Long replyMessageId) {
        messageMapper.updateMessageUser4Reply(id, username, replyMessageId);
    }
}
