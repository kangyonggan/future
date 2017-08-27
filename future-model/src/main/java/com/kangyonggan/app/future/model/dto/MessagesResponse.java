package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Message;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
@Data
public class MessagesResponse extends CommonResponse {

    List<Message> messages;

}
