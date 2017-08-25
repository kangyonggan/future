package com.kangyonggan.app.future.model.dto;

import com.kangyonggan.app.future.model.vo.Book;
import lombok.Data;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/11/17
 */
@Data
public class BooksResponse extends CommonResponse {

    private List<Book> books;

}


