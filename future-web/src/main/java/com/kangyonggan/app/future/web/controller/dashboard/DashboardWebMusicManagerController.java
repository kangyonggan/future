package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.MusicService;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
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
@RequestMapping("dashboard/web/music/manager")
public class DashboardWebMusicManagerController extends BaseController {

    @Autowired
    private MusicService musicService;

    /**
     * 音乐列表
     *
     * @param pageNum
     * @param name
     * @param singer
     * @param status
     * @param isStick
     * @param isDeleted
     * @param uploadUsername
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("WEB_MUSIC_MANAGER")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "name", required = false, defaultValue = "") String name,
                       @RequestParam(value = "singer", required = false, defaultValue = "") String singer,
                       @RequestParam(value = "status", required = false, defaultValue = "") String status,
                       @RequestParam(value = "isStick", required = false, defaultValue = "") String isStick,
                       @RequestParam(value = "isDeleted", required = false, defaultValue = "") String isDeleted,
                       @RequestParam(value = "uploadUsername", required = false, defaultValue = "") String uploadUsername,
                       Model model) {
        List<Music> musics = musicService.searchMusics4Admin(pageNum, name, singer, uploadUsername, status, isStick, isDeleted);
        PageInfo<Music> page = new PageInfo(musics);

        model.addAttribute("page", page);
        model.addAttribute("articleStatus", ArticleStatus.values());
        return getPathList();
    }

}
