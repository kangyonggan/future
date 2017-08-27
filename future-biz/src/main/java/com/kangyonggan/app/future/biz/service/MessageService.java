package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Message;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
public interface MessageService {

    /**
     * 搜索消息
     *
     * @param pageNum
     * @param title
     * @param type
     * @param createdUsername
     * @return
     */
    List<Message> searchMessages(int pageNum, String title, String type, String createdUsername);

    /**
     * 发布消息
     *
     * @param message
     * @param usernames
     */
    void save(Message message, String usernames);

    /**
     * 根据ID查找消息
     *
     * @param id
     * @return
     */
    Message findMessageById(Long id);

    /**
     * 更新消息
     *
     * @param message
     */
    void updateMessage(Message message);

    /**
     * 物理删除消息
     *
     * @param id
     */
    void deleteMessageById(Long id);

    /**
     * 查询未读消息数量
     *
     * @param username
     * @return
     */
    int findMessageCount(String username);

    /**
     * 查找所有消息
     *
     * @param username
     * @return
     */
    List<Message> findMessagesByUsername(String username);

    /**
     * 把消息更新为已读
     *
     * @param messageId
     * @param username
     */
    void updateMessageUser4Read(Long messageId, String username);

    /**
     * 查找未删除的消息
     *
     * @param id
     * @return
     */
    Message findAbleMessageById(Long id);
}
