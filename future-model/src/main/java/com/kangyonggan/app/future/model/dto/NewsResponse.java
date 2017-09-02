package com.kangyonggan.app.future.model.dto;

import com.alibaba.fastjson.JSONArray;
import lombok.Data;

/**
 * @author kangyonggan
 * @since 9/2/17
 */
@Data
public class NewsResponse extends CommonResponse {

    private String next;

    private JSONArray data;

}
