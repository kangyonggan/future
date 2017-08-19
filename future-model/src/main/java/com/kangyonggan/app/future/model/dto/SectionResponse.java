package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Section;
import lombok.Data;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class SectionResponse extends CommonResponse {

    private Section section;

    private boolean isFavorite;

    @Override
    public String toString() {
        return "SectionResponse{" +
                "section=" + section +
                ", isFavorite=" + isFavorite +
                '}' + ", " + super.toString();
    }
}


