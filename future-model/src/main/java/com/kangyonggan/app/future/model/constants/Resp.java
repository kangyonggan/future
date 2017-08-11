package com.kangyonggan.app.future.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum Resp {

    SUCCESS("0000", "成功"),
    FAILURE("0001", "失败");

    /**
     * 响应码
     */
    @Getter
    private final String respCo;

    /**
     * 响应描述
     */
    @Getter
    private final String respMsg;

    Resp(String respCo, String respMsg) {
        this.respCo = respCo;
        this.respMsg = respMsg;
    }

}
