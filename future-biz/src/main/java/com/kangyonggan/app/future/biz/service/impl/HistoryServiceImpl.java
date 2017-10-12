package com.kangyonggan.app.future.biz.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kangyonggan.app.future.biz.service.HistoryService;
import com.kangyonggan.app.future.common.util.HttpUtil;
import com.kangyonggan.app.future.common.util.Log4j2MethodLoggerHandler;
import com.kangyonggan.app.future.mapper.HistoryMapper;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.History;
import com.kangyonggan.methodlogger.MethodLogger;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kangyonggan
 * @since 9/11/17
 */
@Service
@Log4j2
public class HistoryServiceImpl extends BaseService<History> implements HistoryService {

    @Autowired
    private HistoryMapper historyMapper;

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    public List<History> findHistories(int month, int day) {
        Example example = new Example(History.class);
        example.createCriteria().andEqualTo("isDeleted", AppConstants.IS_DELETED_NO)
                .andEqualTo("month", month).andEqualTo("day", day);

        example.setOrderByClause("id desc");

        return myMapper.selectByExample(example);
    }

    @Override
    @MethodLogger(Log4j2MethodLoggerHandler.class)
    @Transactional(propagation = Propagation.NOT_SUPPORTED)
    public void saveHistories() {
        for (int month = 1; month <= 12; month++) {
            for (int day = 1; day <= 31; day++) {
                // 判断库里是否已经有了
                if (exist(month, day)) {
                    log.warn("历史今天一存在，month:{}, day:{}", month, day);
                    continue;
                }

                // 事务一致性
                try {
                    saveMonthDay(month, day);
                } catch (Exception e) {
                    log.warn("抓取历史今天异常, 继续下一个月日", e);
                }
            }
        }

    }

    /**
     * 抓取指定的月日
     *
     * @param month
     * @param day
     * @throws Exception
     */
    private void saveMonthDay(int month, int day) throws Exception {
        List<History> allHistories = new ArrayList();
        int pageNum = 1;
        List<History> histories = parseHistoriesByPage(month, day, pageNum);

        while (histories.size() > 0) {
            allHistories.addAll(histories);
            histories = parseHistoriesByPage(month, day, ++pageNum);
        }

        if (!allHistories.isEmpty()) {
            historyMapper.insertHistories(allHistories);
        }
    }

    private List<History> parseHistoriesByPage(int month, int day, int pageNum) throws Exception {
        List<History> histories = new ArrayList();
        String params = "key=f1c189edea134e3fb821a269817c2cf7&yue=" + month + "&ri=" + day + "&type=1&page=" + pageNum + "&rows=50";
        String result = HttpUtil.sendGet("http://api.avatardata.cn/HistoryToday/LookUp", params);

        JSONObject jsonObject = JSON.parseObject(result);
        int errorCode = jsonObject.getInteger("error_code");
        String reason = jsonObject.getString("reason");
        int total = jsonObject.getInteger("total");
        log.info("month:{}, day:{}, errorCode:{}, reason:{}, total:{}", month, day, errorCode, reason, total);

        if (0 != errorCode) {
            throw new RuntimeException(reason);
        }

        JSONArray jsonArray = jsonObject.getJSONArray("result");

        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject item = jsonArray.getJSONObject(i);
            History history = new History();
            history.setYear(item.getInteger("year"));
            history.setMonth(month);
            history.setDay(day);
            history.setTitle(item.getString("title"));

            if (StringUtils.isNotEmpty(history.getTitle())) {
                histories.add(history);
            }
        }

        return histories;
    }

    /**
     * 判断历史今天是否已存在
     *
     * @param month
     * @param day
     * @return
     */
    private boolean exist(int month, int day) {
        History history = new History();
        history.setMonth(month);
        history.setDay(day);

        return myMapper.selectCount(history) > 0;
    }

}
