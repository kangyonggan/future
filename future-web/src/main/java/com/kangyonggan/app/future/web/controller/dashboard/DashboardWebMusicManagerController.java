package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.MusicService;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.vo.Article;
import com.kangyonggan.app.future.model.vo.Music;
import com.kangyonggan.app.future.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

    /**
     * 删除/恢复
     *
     * @param id
     * @param isDeleted
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{isDeleted:\\bundelete\\b|\\bdelete\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("WEB_MUSIC_MANAGER")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        Music music = musicService.findMusicById(id);
        music.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
        musicService.updateMusic(music);

        model.addAttribute("music", music);
        return getPathTableTr();
    }

    /**
     * 审核通过/审核不通过
     *
     * @param id
     * @param status
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{status:\\bcomplete\\b|\\breject\\b|\\bwaiting\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("WEB_MUSIC_MANAGER")
    public String status(@PathVariable("id") Long id, @PathVariable("status") String status, Model model) {
        Music music = musicService.findMusicById(id);
        music.setStatus(status);
        musicService.updateMusic(music);

        model.addAttribute("music", music);
        return getPathTableTr();
    }

    /**
     * 置顶/取消置顶
     *
     * @param id
     * @param isStick
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{isStick:\\bunstick\\b|\\bstick\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("WEB_MUSIC_MANAGER")
    public String stick(@PathVariable("id") Long id, @PathVariable("isStick") String isStick, Model model) {
        Music music = musicService.findMusicById(id);
        music.setIsStick((byte) (isStick.equals("stick") ? 1 : 0));
        musicService.updateMusic(music);

        model.addAttribute("music", music);
        return getPathTableTr();
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/remove", method = RequestMethod.GET)
    @RequiresPermissions("WEB_MUSIC_MANAGER")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        musicService.deleteMusicById(id);
        return super.getResultMap();
    }

}
