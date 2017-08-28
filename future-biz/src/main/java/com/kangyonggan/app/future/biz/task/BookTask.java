package com.kangyonggan.app.future.biz.task;

import com.kangyonggan.app.future.biz.service.BookService;
import com.kangyonggan.app.future.biz.service.SectionService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author kangyonggan
 * @since 8/16/17
 */
@Component
@Log4j2
public class BookTask {

    @Autowired
    private BookService bookService;

    @Autowired
    private SectionService sectionService;

    /**
     * 每天早上7点更新小说章节
     * cron表达式：* * * * * *（秒 分 时 日 月 星期）
     */
    @Scheduled(cron = "0 0 7 * * *")
    public void executeBookUpdate() {
        log.info("定时任务自动更新小说开始...");
        sectionService.updateSections();
        log.info("定时任务自动更新小说结束!");
    }
//
//    /**
//     * 每周1点更新小说是否完结
//     * cron表达式：* * * * * *（秒 分 时 日 月 星期）
//     */
//    @Scheduled(cron = "0 0 0 * * 1")
//    public void executeBookIsFinished() {
//        log.info("定时任务自动更新小说开始...");
//        bookService.updateBookIsFinished();
//        log.info("定时任务自动更新小说结束!");
//    }

}
