package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.biz.service.BookService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
public class BookServiceTest extends AbstractServiceTest {

    @Autowired
    private BookService bookService;

    @Test
    public void testUpdateBooks() {
        bookService.updateBooksByCode(1);
    }

}
