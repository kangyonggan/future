package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Section;
import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class FindBookSectionResponse extends CommonResponse {

    private Section section;

    @Override
    public String toString() {
        return "FindBookSectionResponse{" +
                "section=" + section +
                '}' + "," + super.toString();
    }
}

