package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.History;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/11/17
 */
@Data
public class HistoriesResponse extends CommonResponse {

    private List<History> histories;

}
