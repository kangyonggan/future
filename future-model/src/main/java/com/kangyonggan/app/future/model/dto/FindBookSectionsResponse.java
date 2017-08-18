package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Section;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class FindBookSectionsResponse extends CommonResponse {

    private List<Section> sections;


    @Override
    public String toString() {
        return "FindBookSectionResponse{" +
                "sections=" + sections +
                '}' + ", " + super.toString();
    }
}


