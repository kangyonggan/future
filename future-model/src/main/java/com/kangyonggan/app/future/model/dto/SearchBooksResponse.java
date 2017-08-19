package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Book;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class SearchBooksResponse extends CommonResponse {

    private List<Book> books;

    @Override
    public String toString() {
        return "SearchBooksResponse{" +
                "books=" + books +
                '}' + ", " + super.toString();
    }
}


