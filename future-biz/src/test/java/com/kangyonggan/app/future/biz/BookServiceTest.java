package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.SectionService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author kangyonggan
 * @since 8/15/17
 */
public class BookServiceTest extends AbstractServiceTest {

    @Autowired
    private BookService bookService;

    @Autowired
    private SectionService sectionService;

    @Test
    public void testUpdateBooks() {
        bookService.updateBooksByCode(1);
    }

    @Test
    public void testUpdateSection() {
        sectionService.updateBookSections(1);
    }

}
