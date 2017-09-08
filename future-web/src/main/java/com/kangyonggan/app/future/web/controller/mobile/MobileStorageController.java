package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.StorageService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.CommonResponse;
import com.kangyonggan.app.future.model.dto.StoragesResponse;
import com.kangyonggan.app.future.model.vo.Storage;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/8/17
 */
@RestController
@RequestMapping("mobile/storage")
@Log4j2
public class MobileStorageController {

    @Autowired
    private StorageService storageService;

    /**
     * 初始化题库
     *
     * @return
     */
    @RequestMapping(value = "parse", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_USER")
    public CommonResponse parse() {
        CommonResponse response = new CommonResponse();

        storageService.saveJZTKStorages();

        response.setRespCo(Resp.SUCCESS.getRespCo());
        response.setRespMsg(Resp.SUCCESS.getRespMsg());
        return response;
    }

    /**
     * 获取科目题库
     *
     * @param pageNum
     * @param subject
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    public StoragesResponse list(@RequestParam("p") int pageNum, @RequestParam("s") String subject) {
        StoragesResponse response = new StoragesResponse();

        try {
            List<Storage> storages = storageService.findStoragesByPage(pageNum, subject);

            response.setStorages(storages);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("获取科目题库异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("获取科目题库异常");
        }

        return response;
    }

}
