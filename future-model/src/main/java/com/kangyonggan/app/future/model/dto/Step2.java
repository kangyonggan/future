package com.kangyonggan.app.future.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/24 0024
 */
@Data
public class Step2 implements Serializable {

    private Long codeId;

    private String pageName;

    private Byte needAdd;

    private String addBtnName;

    private Byte addBtnType;

    private Byte needPage;

    private List<String> columns;

    private List<String> searchColumns;

}
