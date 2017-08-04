package com.kangyonggan.app.future.web.controller.dashboard;

import com.kangyonggan.app.future.biz.service.RedisService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author kangyonggan
 * @since 2017/1/9
 */
@Controller
@RequestMapping("dashboard/system/cache")
public class DashboardSystemCacheController extends BaseController {

    @Autowired
    private RedisService redisService;

    /**
     * redis键的前缀
     */
    private String prefix = PropertiesUtil.getProperties("redis.prefix") + ":";

    /**
     * 缓存管理
     *
     * @param key
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_CACHE")
    public String list(@RequestParam(value = "key", required = false, defaultValue = "") String key,
                       Model model) {
        Set<String> keys = new HashSet();
        if (StringUtils.isNotEmpty(key)) {
            keys = redisService.getKeys(prefix + key);
        }

        model.addAttribute("keys", keys);
        return getPathList();
    }

    /**
     * 缓存详情
     *
     * @param key
     * @param model
     * @return
     */
    @RequestMapping(value = "{key:[\\w:]+}", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_CACHE")
    public String detail(@PathVariable("key") String key, Model model) {
        Object cache = redisService.get(key);

        model.addAttribute("key", key);
        model.addAttribute("cache", cache);
        model.addAttribute("isList", cache instanceof List);
        return getPathDetail();
    }

    /**
     * 清空缓存
     *
     * @param key
     * @return
     */
    @RequestMapping(value = "{key:[\\w:]+}/clear", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_CACHE")
    @ResponseBody
    public Map<String, Object> clear(@PathVariable("key") String key) {
        redisService.delete(key);
        return getResultMap();
    }

    /**
     * 清空列表缓存
     *
     * @param key
     * @return
     */
    @RequestMapping(value = "clearall", method = RequestMethod.GET)
    @RequiresPermissions("SYSTEM_CACHE")
    @ResponseBody
    public Map<String, Object> clearList(@RequestParam("key") String key) {
        redisService.deleteAll(prefix + key);
        return getResultMap();
    }

}
