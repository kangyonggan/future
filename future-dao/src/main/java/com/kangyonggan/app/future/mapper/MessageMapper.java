package com.kangyonggan.app.future.mapper;

import com.kangyonggan.app.future.model.vo.Message;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageMapper extends MyMapper<Message> {

    /**
     * 删除消息分发数据
     *
     * @param id
     */
    void deleteMessageUserByMessageId(Long id);

    /**
     * 保存消息分发用户
     *
     * @param messageId
     * @param usernames
     */
    void insertMessageUsers(@Param("messageId") Long messageId, @Param("usernames") String[] usernames);
}