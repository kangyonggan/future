package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.biz.service.UserService;
import com.kangyonggan.app.future.common.util.StringUtil;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.CommonResponse;
import com.kangyonggan.app.future.model.vo.User;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 8/27/17
 */
@RestController
@RequestMapping("mobile/user")
@Log4j2
public class MobileUserController {

    @Autowired
    private UserService userService;

    /**
     * 修改用户信息
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public CommonResponse update(@ModelAttribute("user") User user) {
        user.setRealname(StringUtil.decode(user.getRealname()));
        CommonResponse response = new CommonResponse();

        try {
            userService.updateUserByUsername(user);

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            log.warn("修改用户信息异常", e);
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg(Resp.FAILURE.getRespMsg());
        }

        return response;
    }

}
