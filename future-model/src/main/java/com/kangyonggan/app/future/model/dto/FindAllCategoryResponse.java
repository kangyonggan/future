package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Category;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class FindAllCategoryResponse extends CommonResponse {

    private List<Category> categories;

    @Override
    public String toString() {
        return "FindAllCategoryResponse{" +
                "categories=" + categories +
                "}, " + super.toString();
    }
}
