package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Section;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class SectionsResponse extends CommonResponse {

    private List<Section> sections;

    private String bookName;

    @Override
    public String toString() {
        return "SectionsResponse{" +
                "sections=" + sections +
                ", bookName='" + bookName + '\'' +
                '}';
    }
}


