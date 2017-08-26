package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.User;
import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class TokenResponse extends CommonResponse {

    private String token;

    private User user;

}
