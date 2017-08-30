package com.kangyonggan.app.future.web.controller.mobile;

import com.kangyonggan.app.future.common.util.DestinyUtil;
import com.kangyonggan.app.future.common.util.IDCardUtil;
import com.kangyonggan.app.future.model.constants.Resp;
import com.kangyonggan.app.future.model.dto.IdcardResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 8/30/17
 */
@RestController
@RequestMapping("mobile/tool")
public class MobileToolController {

    /**
     * 身份证号码校验
     *
     * @param idcard
     */
    @RequestMapping(value = "idcard/verify", method = RequestMethod.POST)
    public IdcardResponse idcardVerify(@RequestParam("idcard") String idcard) {
        IdcardResponse response = new IdcardResponse();

        try {
            String res[] = IDCardUtil.isIdCard(idcard);
            response.setIdCard(res[0].equals("0"));

            if (res[0].equals("0")) {
                String year = IDCardUtil.getYearFromIdCard(idcard);
                response.setProvince(IDCardUtil.getProvinceFromIdCard(idcard));
                response.setAge(IDCardUtil.getAgeFromIdCard(idcard));
                response.setYear(year);
                String month = IDCardUtil.getMonthFromIdCard(idcard);
                response.setMonth(month);
                String day = IDCardUtil.getDayFromIdCard(idcard);
                response.setDay(day);
                response.setSex(IDCardUtil.getSexFromIdCard(idcard) == 0 ? "男" : "女");
                response.setArea(IDCardUtil.getAreaFromIdCard(idcard));
                response.setShengXiao(DestinyUtil.getShengXiao(Integer.parseInt(year)));
                response.setGanZhi(DestinyUtil.getYearColumn(Integer.parseInt(year)));
                String tianGan = DestinyUtil.getDayColumn(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day)).substring(0, 1);
                response.setYunshi(DestinyUtil.getYunShi(DestinyUtil.getTianGanWuXing(tianGan), Integer.parseInt(month)));

                if (idcard.length() == 15) {
                    response.setTransCard(IDCardUtil.convert15To18(idcard));
                } else {
                    response.setTransCard(IDCardUtil.convert18To15(idcard));
                }
            }

            response.setRespCo(Resp.SUCCESS.getRespCo());
            response.setRespMsg(Resp.SUCCESS.getRespMsg());
        } catch (Exception e) {
            response.setRespCo(Resp.FAILURE.getRespCo());
            response.setRespMsg("身份证号码校验异常");
        }

        return response;
    }

}
