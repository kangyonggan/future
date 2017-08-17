package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Section;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class FindBookSectionResponse extends CommonResponse {

    private List<Section> sections;

    private long total;

    private int pages;

    @Override
    public String toString() {
        return "FindBookSectionResponse{" +
                "sections=" + sections +
                ", total=" + total +
                ", pages=" + pages +
                '}' + ", " + super.toString();
    }
}


