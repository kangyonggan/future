package com.kangyonggan.app.future.web.controller.dashboard;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.MusicService;
import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.biz.util.PropertiesUtil;
import com.kangyonggan.app.future.common.util.FileUtil;
import com.kangyonggan.app.future.common.util.Mp3Util;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Music;
import com.kangyonggan.app.future.model.vo.ShiroUser;
import com.kangyonggan.app.future.web.controller.BaseController;
import com.kangyonggan.app.future.web.util.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 9/4/17
 */
@Controller
@RequestMapping("dashboard/web/music/store")
public class DashboardWebMusicStoreController extends BaseController {

    @Autowired
    private MusicService musicService;

    @Autowired
    private UserService userService;

    /**
     * 音乐库
     *
     * @param pageNum
     * @param name
     * @param singer
     * @param uploadUsername
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("WEB_MUSIC_STORE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "name", required = false, defaultValue = "") String name,
                       @RequestParam(value = "singer", required = false, defaultValue = "") String singer,
                       @RequestParam(value = "uploadUsername", required = false, defaultValue = "") String uploadUsername,
                       Model model) {
        List<Music> musics = musicService.searchMusics(pageNum, name, singer, uploadUsername);
        PageInfo<Music> page = new PageInfo(musics);

        model.addAttribute("page", page);
        return getPathList();
    }

    /**
     * 上传音乐
     *
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    @RequiresPermissions("WEB_MUSIC_STORE")
    public String create() {
        return getPathFormModal();
    }

    /**
     * 上传音乐
     *
     * @param file
     * @return
     * @throws FileUploadException
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("WEB_MUSIC_STORE")
    public Map<String, Object> info(@RequestParam(value = "file", required = false) MultipartFile file) throws FileUploadException {
        Map<String, Object> resultMap = getResultMap();
        ShiroUser shiroUser = userService.getShiroUser();

        if (file != null && !file.isEmpty()) {
            String filename = FileUpload.upload(file);
            Map<String, Object> map = Mp3Util.parse(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + filename, PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + "cover");

            if ((int) map.get("respCo") == 0) {
                // 重新保存文件，使用新的文件名: 歌手 - 歌曲名.mp3
                String newFilename = "music/" + map.get("singer") + " - " + map.get("name") + ".mp3";
                FileUpload.copy(filename, newFilename);
                FileUtil.delete(PropertiesUtil.getProperties(AppConstants.FILE_PATH_ROOT) + filename);

                // 落库
                map.put("uploadUsername", shiroUser.getUsername());
                try {
                    musicService.save(map);
                } catch (Exception e) {
                    setResultMapFailure(resultMap, "此音乐已存在，不可重复上传");
                }
            } else {
                setResultMapFailure(resultMap, (String) map.get("respMsg"));
            }
        } else {
            setResultMapFailure(resultMap, "文件不能为空");
        }

        return resultMap;
    }

}
