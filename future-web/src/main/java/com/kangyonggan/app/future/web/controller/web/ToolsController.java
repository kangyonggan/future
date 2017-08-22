package com.kangyonggan.app.future.web.controller.web;

import com.kangyonggan.app.future.biz.service.DictionaryService;
import com.kangyonggan.app.future.biz.service.ToolService;
import com.kangyonggan.app.future.biz.util.*;
import com.kangyonggan.app.future.common.util.*;
import com.kangyonggan.app.future.model.vo.Dictionary;
import com.kangyonggan.app.future.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 2017/4/21 0021
 */
@Controller
@RequestMapping("tools")
@Log4j2
public class ToolsController extends BaseController {

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private ToolService toolService;

    private SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");

    /**
     * 工具列表
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return getPathIndex();
    }

    /**
     * ASCLL码对照表
     *
     * @return
     */
    @RequestMapping(value = "ascll", method = RequestMethod.GET)
    public String ascll(Model model) {
        List<Dictionary> asclls = dictionaryService.findDictionariesByType("ASCLL");

        model.addAttribute("asclls", asclls);
        return getPathRoot() + "/ascll";
    }

    /**
     * HTML转义字符
     *
     * @return
     */
    @RequestMapping(value = "html", method = RequestMethod.GET)
    public String html(Model model) {
        List<Dictionary> htmls = dictionaryService.findDictionariesByType("HTML");

        model.addAttribute("htmls", htmls);
        return getPathRoot() + "/html";
    }

    /**
     * XML格式化
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "xml", method = RequestMethod.GET)
    public String xml(Model model) {
        return getPathRoot() + "/xml";
    }

    /**
     * XML格式化
     *
     * @param data
     * @param model
     * @return
     */
    @RequestMapping(value = "xml", method = RequestMethod.POST)
    public String xml(@RequestParam("data") String data, Model model) {
        String result;
        try {
            result = toolService.formatXml(data);
        } catch (Exception e) {
            result = e.getMessage();
        }

        model.addAttribute("result", result);
        return getPathRoot() + "/xml";
    }

    /**
     * SQL格式化
     *
     * @return
     */
    @RequestMapping(value = "sql", method = RequestMethod.GET)
    public String sql() {
        return getPathRoot() + "/sql";
    }

    /**
     * SQL格式化
     *
     * @param data
     * @param dialect
     * @param model
     * @return
     */
    @RequestMapping(value = "sql", method = RequestMethod.POST)
    public String sql(@RequestParam("data") String data,
                      @RequestParam(value = "dialect", required = false, defaultValue = "MySQL") String dialect,
                      Model model) {
        String result;
        try {
            result = toolService.formatSql(data, dialect);
        } catch (Exception e) {
            result = e.getMessage();
        }
        model.addAttribute("result", result);
        return getPathRoot() + "/sql";
    }

    /**
     * JSON格式化
     *
     * @return
     */
    @RequestMapping(value = "json", method = RequestMethod.GET)
    public String json() {
        return getPathRoot() + "/json";
    }

    /**
     * JSON格式化
     *
     * @param data
     * @param model
     * @return
     */
    @RequestMapping(value = "json", method = RequestMethod.POST)
    public String json(@RequestParam("data") String data, Model model) {
        String result;

        try {
            result = GsonUtil.format(data);
        } catch (Exception e) {
            result = e.getMessage();
        }

        model.addAttribute("result", result);
        return getPathRoot() + "/json";
    }

    /**
     * Markdown编辑器
     *
     * @return
     */
    @RequestMapping(value = "markdown", method = RequestMethod.GET)
    public String markdown() {
        return getPathRoot() + "/markdown";
    }

    /**
     * Markdown编辑器
     *
     * @param data
     * @param model
     * @return
     */
    @RequestMapping(value = "markdown", method = RequestMethod.POST)
    public String markdown(@RequestParam("data") String data, Model model) {
        String result;
        try {
            result = MarkdownUtil.markdownToHtml(data);
        } catch (Exception e) {
            result = e.getMessage();
        }

        model.addAttribute("result", result);
        return getPathRoot() + "/markdown";
    }

    /**
     * JS压缩
     *
     * @return
     */
    @RequestMapping(value = "js", method = RequestMethod.GET)
    public String js() {
        return getPathRoot() + "/js";
    }

    /**
     * JS压缩
     *
     * @param data
     * @param model
     * @return
     */
    @RequestMapping(value = "js", method = RequestMethod.POST)
    public String js(@RequestParam("data") String data, Model model) {
        Map<String, String> resultMap = new HashedMap();
        try {
            resultMap = CompressorUtil.compressJS(data);
        } catch (Exception e) {
            resultMap.put("errorMsg", e.getMessage());
        }
        model.addAttribute("resultMap", resultMap);
        return getPathRoot() + "/js";
    }

    /**
     * CSS压缩
     *
     * @return
     */
    @RequestMapping(value = "css", method = RequestMethod.GET)
    public String css() {
        return getPathRoot() + "/css";
    }

    /**
     * CSS压缩
     *
     * @param data
     * @param model
     * @return
     */
    @RequestMapping(value = "css", method = RequestMethod.POST)
    public String css(@RequestParam("data") String data, Model model) {
        String result;
        try {
            result = CompressorUtil.compressCSS(data);
        } catch (Exception e) {
            result = e.getMessage();
        }
        model.addAttribute("result", result);
        return getPathRoot() + "/css";
    }

    /**
     * 二维码
     *
     * @return
     */
    @RequestMapping(value = "qr", method = RequestMethod.GET)
    public String qr() {
        return getPathRoot() + "/qr";
    }

    /**
     * 二维码
     *
     * @param data
     * @param size
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "qr", method = RequestMethod.POST)
    public String qr(@RequestParam("data") String data, @RequestParam(value = "size", required = false, defaultValue = "200") int size,
                     Model model) throws Exception {
        if (StringUtils.isEmpty(data)) {
            return getPathRoot() + "/qr";
        }

        String qrName = "QR" + format.format(new Date()) + ".png";
        String name = com.kangyonggan.app.future.biz.util.PropertiesUtil.getProperties("file.root.path") + "upload/" + qrName;
        log.info("生成二维码的名称:" + qrName);
        try {
            QrCodeUtil.genQrCode(name, data, size);
            log.info("二维码生成成功");
        } catch (Exception e) {
            log.error("生成二维码失败", e);
            throw e;
        }
        model.addAttribute("result", qrName);
        return getPathRoot() + "/qr";
    }

    /**
     * 二维码解析
     *
     * @return
     */
    @RequestMapping(value = "qr2", method = RequestMethod.GET)
    public String qr2() {
        return getPathRoot() + "/qr2";
    }

    /**
     * 二维码解析
     *
     * @param data
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "qr2", method = RequestMethod.POST)
    @ResponseBody
    public String qr2(@RequestParam(value = "data", required = false, defaultValue = "") String data,
                      @RequestParam(value = "file", required = false) MultipartFile file) throws Exception {

        String result;
        try {
            if (StringUtils.isEmpty(data)) {
                result = QrCodeUtil.decode(file.getInputStream());
            } else {
                result = QrCodeUtil.decode(data);
            }
        } catch (Exception e) {
            result = "无法解析：" + e.getMessage();
        }

        log.info("qr解码结果：{}", result);
        return result;
    }

    /**
     * 身份证查询
     *
     * @return
     */
    @RequestMapping(value = "idcard", method = RequestMethod.GET)
    public String idcard() {
        return getPathRoot() + "/idcard";
    }

    /**
     * 身份证查询
     *
     * @param data
     * @param model
     * @return
     */
    @RequestMapping(value = "idcard", method = RequestMethod.POST)
    public String idcard(@RequestParam("data") String data, Model model) {
        String res[] = IDCardUtil.isIdCard(data);
        if (res[0].equals("0")) {
            String year = IDCardUtil.getYearFromIdCard(data);
            model.addAttribute("province", IDCardUtil.getProvinceFromIdCard(data));
            model.addAttribute("age", IDCardUtil.getAgeFromIdCard(data));
            model.addAttribute("year", year);
            String month = IDCardUtil.getMonthFromIdCard(data);
            model.addAttribute("month", month);
            String day = IDCardUtil.getDayFromIdCard(data);
            model.addAttribute("day", day);
            model.addAttribute("sex", IDCardUtil.getSexFromIdCard(data));
            model.addAttribute("area", IDCardUtil.getAreaFromIdCard(data));
            model.addAttribute("shengXiao", DestinyUtil.getShengXiao(Integer.parseInt(year)));
            model.addAttribute("ganZhi", DestinyUtil.getYearColumn(Integer.parseInt(year)));
            String tianGan = DestinyUtil.getDayColumn(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day)).substring(0, 1);
            model.addAttribute("yunshi", DestinyUtil.getYunShi(DestinyUtil.getTianGanWuXing(tianGan), Integer.parseInt(month)));

            if (data.length() == 15) {
                model.addAttribute("to18", IDCardUtil.convert15To18(data));
            } else {
                model.addAttribute("to15", IDCardUtil.convert18To15(data));
            }
        }

        model.addAttribute("isIdCard", res[0].equals("0"));
        return getPathRoot() + "/idcard";
    }

    /**
     * 生成身份证
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "gencard", method = RequestMethod.GET)
    public String gencard(Model model) {
        model.addAttribute("cityCodes", IDCardUtil.getCityCodes());
        return getPathRoot() + "/gencard";
    }

    /**
     * 身份生成证
     *
     * @param prov
     * @param startAge
     * @param endAge
     * @param sex
     * @param len
     * @param size
     * @param model
     * @return
     */
    @RequestMapping(value = "gencard", method = RequestMethod.POST)
    public String gencard(@RequestParam("prov") String prov,
                          @RequestParam("startAge") int startAge,
                          @RequestParam("endAge") int endAge,
                          @RequestParam("sex") String sex,
                          @RequestParam("len") int len,
                          @RequestParam("size") int size,
                          Model model) {
        model.addAttribute("cityCodes", IDCardUtil.getCityCodes());

        String result = "";
        if (size < 0 || size > 100) {
            result = "生成数量控制在1~100之间（包括）";
        } else {
            List<String> list = IDCardUtil.genIdCard(prov, startAge, endAge, sex, len, size);

            for (String str : list) {
                result += str + "\n\n";
            }
        }

        model.addAttribute("result", result);
        return getPathRoot() + "/gencard";
    }

    /**
     * 编码转换
     *
     * @return
     */
    @RequestMapping(value = "charset", method = RequestMethod.GET)
    public String charset() {
        return getPathRoot() + "/charset";
    }

    /**
     * 编码转换
     *
     * @param data
     * @param charset
     * @param model
     * @return
     */
    @RequestMapping(value = "charset", method = RequestMethod.POST)
    public String charset(@RequestParam("data") String data,
                          @RequestParam("charset") String charset,
                          Model model) {
        model.addAttribute("result", CharsetUtil.convert(data, charset));
        return getPathRoot() + "/charset";
    }

    /**
     * 文件对比
     *
     * @return
     */
    @RequestMapping(value = "compare", method = RequestMethod.GET)
    public String compare() {
        return getPathRoot() + "/compare";
    }

    /**
     * 文件对比
     *
     * @param fileLeft
     * @param fileRight
     * @return
     */
    @RequestMapping(value = "compare", method = RequestMethod.POST)
    @ResponseBody
    public String compare(@RequestParam("fileLeft") MultipartFile fileLeft,
                          @RequestParam("fileRight") MultipartFile fileRight) {
        try {
            return toolService.compareProperties(fileLeft.getInputStream(), fileRight.getInputStream());
        } catch (Exception e) {
            return "不是合法的文件，请文明使用。" + e.getMessage();
        }
    }

    /**
     * 八字五行
     *
     * @return
     */
    @RequestMapping(value = "bazi", method = RequestMethod.GET)
    public String bazi() {
        return getPathRoot() + "/bazi";
    }

    /**
     * 八字五行
     *
     * @param lunar
     * @param year
     * @param month
     * @param day
     * @param hour
     * @param model
     * @return
     */
    @RequestMapping(value = "bazi", method = RequestMethod.POST)
    public String bazi(@RequestParam(value = "lunar", required = false, defaultValue = "1") String lunar,
                       @RequestParam("year") int year,
                       @RequestParam("month") int month,
                       @RequestParam("day") int day,
                       @RequestParam("hour") int hour,
                       Model model) {
        String result;
        try {
            result = toolService.getBaZi(lunar, year, month, day, hour);
        } catch (Exception e) {
            result = e.getMessage();
        }

        model.addAttribute("result", result);
        return getPathRoot() + "/bazi";
    }

    /**
     * 智能小胖
     *
     * @return
     */
    @RequestMapping(value = "chat", method = RequestMethod.GET)
    public String chat() {
        return getPathRoot() + "/chat";
    }

}
