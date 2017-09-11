package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.biz.service.HistoryService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author kangyonggan
 * @since 9/11/17
 */
public class HistoryInitTest extends AbstractServiceTest {

    @Autowired
    private HistoryService historyService;

    @Test
    public void testInsert() throws Exception {
        historyService.saveHistories();
    }

}
