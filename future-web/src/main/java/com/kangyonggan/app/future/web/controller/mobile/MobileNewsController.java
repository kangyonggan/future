package com.kangyonggan.app.future.web.controller.mobile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kangyonggan.app.future.biz.util.NewsHelper;
import com.kangyonggan.app.future.common.util.HttpUtil;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.NewsResponse;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 9/2/17
 */
@RestController
@RequestMapping("mobile/news")
@Log4j2
public class MobileNewsController {

    /**
     * 头条手机网页版
     */
    private static final String DOMAIN = "https://m.toutiao.com/";

    /**
     * 新闻列表
     *
     * @param tag
     * @param minBehotTime
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    public NewsResponse list(@RequestParam("tag") String tag, @Param("minBehotTime") String minBehotTime) {
        NewsResponse response = new NewsResponse();

        try {
            JSONObject params = NewsHelper.getUrlParam();
            int maxReTryCount = 10;
            int reTryCount = 1;
            String result = null;
            while (reTryCount <= maxReTryCount) {
                try {
                    result = HttpUtil.sendGet(DOMAIN + "list/", String.format("tag=%s&ac=wap&count=20&format=json_raw&as=%s&cp=%s&min_behot_time=%s", tag, params.getString("as"), params.getString("cp"), minBehotTime));
                    break;
                } catch (Exception e) {
                    log.info("抓取新闻第{}次异常, 最多重试{}次", reTryCount++, maxReTryCount);
                }
            }

            if (StringUtils.isEmpty(result)) {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("连续抓取新闻" + maxReTryCount + "次都失败，不再抓取");
                return response;
            }

            JSONObject jsonObject = JSON.parseObject(result);
            JSONArray data = jsonObject.getJSONArray("data");

            if (!data.isEmpty()) {
                String next = data.getJSONObject(0).getString("behot_time");

                response.setData(data);
                response.setNext(next);
                log.info("新闻抓取成功，next={}", next);
                response.setRespCo(Resp.SUCCESS.getRespCo());
                response.setRespMsg(Resp.SUCCESS.getRespMsg());
            } else {
                response.setRespCo(Resp.FAILURE.getRespCo());
                response.setRespMsg("没有更多新闻了");
            }
        } catch (Exception e) {
            log.warn("获取新闻异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("获取新闻异常，请稍后重试");
        }

        return response;
    }

}
