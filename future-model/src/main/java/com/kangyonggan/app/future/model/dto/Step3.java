package com.kangyonggan.app.future.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/24 0024
 */
@Data
public class Step3 implements Serializable {

    private Long codeId;

    private List<String> detailColumns;

}
