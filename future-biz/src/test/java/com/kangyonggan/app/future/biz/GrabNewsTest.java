package com.kangyonggan.app.future.biz;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kangyonggan.app.future.biz.service.CategoryService;
import com.kangyonggan.app.future.biz.service.NewsService;
import com.kangyonggan.app.future.biz.util.NewsHelper;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.FileUtil;
import com.kangyonggan.app.future.common.util.HttpUtil;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.CategoryType;
import com.kangyonggan.app.future.model.vo.Category;
import com.kangyonggan.app.future.model.vo.News;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/8/31 0031
 */
public class GrabNewsTest extends AbstractServiceTest {

    /**
     * 头条手机网页版
     */
    private static final String DOMAIN = "https://m.toutiao.com/";

    @Autowired
    private NewsService newsService;

    @Autowired
    private CategoryService categoryService;

    @Test
    public void testGrab() throws Exception {
        String categoryCode = "__all__";
//        String categoryCode = "news_hot";
//        String categoryCode = "essay_joke";
        String behot = "0";
        while (StringUtils.isNotEmpty(behot)) {
            behot = grabNews(categoryCode, behot);
        }

        System.out.println("over!");
    }

    private String grabNews(String categoryCode, String behot) throws Exception {
        JSONObject params = NewsHelper.getUrlParam();
        String result = HttpUtil.sendGet(DOMAIN + "list/", String.format("tag=%s&ac=wap&count=20&format=json_raw&as=%s&cp=%s&min_behot_time=%s", categoryCode, params.getString("as"), params.getString("cp"), behot));
        JSONObject jsonObject = JSON.parseObject(result);
        JSONArray data = jsonObject.getJSONArray("data");
        JSONObject next = jsonObject.getJSONObject("next");

        for (int i = 0; i < data.size(); i++) {
            JSONObject newsObject = data.getJSONObject(i);

            // 取原始数据
            String code = newsObject.getString("group_id");
            String title = newsObject.getString("title");
            String source = newsObject.getString("source");
            String content = newsObject.getString("content");
            String summary = newsObject.getString("abstract");
            String categoryCode2 = newsObject.getString("tag");
            String imageUrl = newsObject.getString("image_url");
            String gallaryImageCount = newsObject.getString("gallary_image_count");
            String keywords = newsObject.getString("keywords");

            // 对数据加工
            if (!"__all__".equals(categoryCode2)) {
                categoryCode2 = categoryCode;
            }
            Category category = categoryService.findCategoryByTypeAndCode(CategoryType.NEWS.getType(), categoryCode2);
            String categoryName;
            if (category != null) {
                categoryName = category.getName();
            } else {
                categoryCode2 = "news";
                categoryName = "其他";
            }

            if (StringUtils.isNotEmpty(imageUrl)) {
                String filePath = "news/" + code;
                FileUtil.saveToFile("https:" + imageUrl, PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + filePath);
                imageUrl = filePath;
            }

            // 存储数据
            News news = new News();
            news.setCode(code);
            news.setTitle(title);
            news.setSource(source);
            news.setContent(StringUtils.defaultIfEmpty(content, ""));
            news.setSummary(StringUtils.defaultIfEmpty(summary, ""));
            news.setCategoryCode(categoryCode2);
            news.setCategoryName(categoryName);
            news.setImageUrl(StringUtils.defaultIfEmpty(imageUrl, ""));
            if (StringUtils.isNotEmpty(gallaryImageCount)) {
                news.setGallaryImageCount(Integer.parseInt(gallaryImageCount));
            } else {
                news.setGallaryImageCount(0);
            }
            news.setKeywords(StringUtils.defaultIfEmpty(keywords, ""));

            newsService.saveNews(news);

            // 抓取新闻详情
            grabNewsDetail(news);
        }

        if (next == null || "0".equals(next.getString("max_behot_time"))) {
            return null;
        }

        return next.getString("max_behot_time");
    }

    /**
     * 抓取新闻详情
     *
     * @param news
     */
    private void grabNewsDetail(News news) throws Exception {
        String result = HttpUtil.sendGet(DOMAIN + "i" + news.getCode() + "/info/");
        JSONObject jsonObject = JSON.parseObject(result);
        String content = jsonObject.getJSONObject("data").getString("content");
        news.setContent(content);

        newsService.updateNews(news);
    }
}
