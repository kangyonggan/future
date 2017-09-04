package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.MusicService;
import com.kangyonggan.app.future.model.vo.Music;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/4/17
 */
@Controller
@RequestMapping("dashboard/web/music/store")
public class DashboardWebMusicStoreController extends BaseController {

    @Autowired
    private MusicService musicService;

    /**
     * 音乐库
     *
     * @param pageNum
     * @param name
     * @param singer
     * @param tags
     * @param uploadUsername
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("WEB_MUSIC_STORE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "name", required = false, defaultValue = "") String name,
                       @RequestParam(value = "singer", required = false, defaultValue = "") String singer,
                       @RequestParam(value = "tags", required = false, defaultValue = "") String tags,
                       @RequestParam(value = "uploadUsername", required = false, defaultValue = "") String uploadUsername,
                       Model model) {
        List<Music> musics = musicService.searchMusics(pageNum, name, singer, tags, uploadUsername, null, null, null);
        PageInfo<Music> page = new PageInfo(musics);

        model.addAttribute("page", page);
        return getPathList();
    }

}
