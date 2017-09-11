package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.HistoryService;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.HistoriesResponse;
import com.kangyonggan.app.future.model.vo.History;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/11/17
 */
@RestController
@RequestMapping("mobile/history")
@Log4j2
public class MobileHistoryController {

    @Autowired
    private HistoryService historyService;

    /**
     * 查询历史今天
     *
     * @param month
     * @param day
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.POST)
    public HistoriesResponse list(@RequestParam("month") int month, @RequestParam("day") int day) {
        HistoriesResponse response = new HistoriesResponse();

        try {
            List<History> histories = historyService.findHistories(month, day);

            response.setHistories(histories);
            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("查询历史今天异常");
            log.warn("查询历史今天异常", e);
        }

        return response;
    }

}
