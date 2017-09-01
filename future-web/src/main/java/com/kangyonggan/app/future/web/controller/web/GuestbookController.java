package com.kangyonggan.app.future.web.controller.web;

import com.github.pagehelper.PageInfo;
import com.kangyonggan.app.future.biz.service.GuestbookService;
import com.kangyonggan.app.future.common.util.IPUtil;
import com.kangyonggan.app.future.model.vo.Guestbook;
import com.kangyonggan.app.future.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 9/1/17
 */
@Controller
@RequestMapping("guestbook")
@Log4j2
public class GuestbookController extends BaseController {

    @Autowired
    private GuestbookService guestbookService;

    /**
     * 留言板
     *
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                        Model model) {
        List<Guestbook> guestbooks = guestbookService.findGuestbookByPage(pageNum);
        PageInfo<Guestbook> page = new PageInfo(guestbooks);

        model.addAttribute("page", page);
        return getPathIndex();
    }

    /**
     * 保存言板
     *
     * @param guestbook
     * @param result
     * @param request
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("guestbook") Guestbook guestbook, BindingResult result, HttpServletRequest request) {
        Map<String, Object> resultMap = getResultMap();

        if (result.hasErrors()) {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "表单错误");

            return resultMap;
        }

        // 访问量控制
        String ip = IPUtil.getIp(request);
        boolean isQuickWrite = guestbookService.isQuickWrite(ip);
        if (!isQuickWrite) {
            guestbook.setIp(ip);
            guestbookService.saveGuestbook(guestbook);

            log.info("异步查询ip信息，查回后更新");
            guestbookService.updateGuestbookIpInfo(guestbook.getId(), ip);
        } else {
            resultMap.put(ERR_CODE, FAILURE);
            resultMap.put(ERR_MSG, "为防止灌水，请于三分钟之后再次评论");

            return resultMap;
        }

        return resultMap;
    }

}
