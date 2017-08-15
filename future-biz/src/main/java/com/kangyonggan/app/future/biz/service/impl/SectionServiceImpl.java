package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.RedisService;
import com.kangyonggan.app.future.biz.service.SectionService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.model.annotation.LogTime;
import com.kangyonggan.app.future.model.vo.Section;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

/**
 * @author kangyonggan
 * @since 2017/8/15 0015
 */
@Service
@Log4j2
public class SectionServiceImpl extends BaseService<Section> implements SectionService {

    private static final String SECTION_UPDATE_FLAG = "section:update:flag";

    @Autowired
    private RedisService redisService;

    private String prefix = PropertiesUtil.getProperties("redis.prefix") + ":";

    @PostConstruct
    public void init() {
        redisService.delete(prefix + SECTION_UPDATE_FLAG);
        log.info("小说章节更新标识已重置");
    }

    @Override
    @LogTime
    public boolean updateBookSections(int code) {
        Object flag = redisService.get(prefix + SECTION_UPDATE_FLAG);

        if (flag != null) {
            log.info("其他小说正在更新, 此处更新终止");
            return false;
        }
        redisService.set(prefix + SECTION_UPDATE_FLAG, "1");

        new Thread(){
            @Override
            public void run() {
                // TODO 抓取小说章节

                redisService.delete(prefix + SECTION_UPDATE_FLAG);
            }
        }.start();

        return true;
    }
}
