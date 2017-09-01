package com.kangyonggan.app.future.biz.service.impl;

import com.kangyonggan.app.future.biz.service.NewsService;
import com.kangyonggan.app.future.model.vo.News;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

/**
 * @author kangyonggan
 * @since 8/31/17
 */
@Service
@Log4j2
public class NewsServiceImpl extends BaseService<News> implements NewsService {

    @Override
    public void saveNews(News news) {
        try {
            myMapper.insertSelective(news);
        } catch (Exception e) {
            log.info("此新闻已存在，不可重复插入, code={}", news.getCode());
        }
    }

    @Override
    public void updateNews(News news) {
        myMapper.updateByPrimaryKeySelective(news);
    }

}
