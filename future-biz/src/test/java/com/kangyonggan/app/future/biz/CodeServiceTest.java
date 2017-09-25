package com.kangyonggan.app.future.biz;

import com.kangyonggan.app.future.biz.service.CodeService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
public class CodeServiceTest extends AbstractServiceTest {

    @Autowired
    private CodeService codeService;

    @Test
    public void tesGenerate() {
        codeService.generateCode(1L);
    }

}
