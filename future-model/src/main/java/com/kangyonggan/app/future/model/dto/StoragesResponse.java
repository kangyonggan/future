package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Storage;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/8/17
 */
@Data
public class StoragesResponse extends CommonResponse {

    private List<Storage> storages;

}
