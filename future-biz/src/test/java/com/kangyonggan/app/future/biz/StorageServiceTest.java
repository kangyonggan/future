package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.biz.service.StorageService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author kangyonggan
 * @since 9/8/17
 */
public class StorageServiceTest extends AbstractServiceTest {

    @Autowired
    private StorageService storageService;

    @Test
    public void testInsert() throws Exception {
        storageService.saveJZTKStorages();
    }

}
