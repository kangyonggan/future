package com.kangyonggan.app.future.model.dto;

import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class RegisterResponse extends CommonResponse {

    private String token;

    @Override
    public String toString() {
        return "RegisterResponse{" +
                "token='" + token + '\'' +
                '}' + ", " + super.toString();
    }
}
