package com.kangyonggan.app.future.model.dto;

import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/30/17
 */
@Data
public class IdcardGenerateResponse extends CommonResponse {

    private List<String> idcards;

}
