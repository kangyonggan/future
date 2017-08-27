package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Message;
import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
@Data
public class MessageResponse extends CommonResponse {

    private Message message;

    private Message replyMessage;

}
