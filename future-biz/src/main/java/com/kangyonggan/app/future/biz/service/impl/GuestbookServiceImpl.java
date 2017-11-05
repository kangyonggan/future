package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.GuestbookService;
import com.kangyonggan.app.future.common.util.DateUtil;
import com.kangyonggan.app.future.common.util.IPUtil;
import com.kangyonggan.app.future.common.util.MarkdownUtil;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.constants.ArticleStatus;
import com.kangyonggan.app.future.model.vo.Guestbook;
import com.kangyonggan.extra.core.annotation.Log;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 9/1/17
 */
@Service
@Log4j2
public class GuestbookServiceImpl extends BaseService<Guestbook> implements GuestbookService {

    @Override
    public List<Guestbook> searchGuestbook(int pageNum, String status) {
        Example example = new Example(Guestbook.class);

        if (StringUtils.isNotEmpty(status)) {
            example.createCriteria().andEqualTo("status", status);
        }

        example.selectProperties("id", "realname", "email", "content", "status", "adjustUsername", "ip", "ipInfo", "isDeleted", "createdTime", "updatedTime");

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    @Log
    public void saveGuestbook(Guestbook guestbook) {
        guestbook.setStatus(ArticleStatus.WAITING.getStatus().toLowerCase());
        guestbook.setReplyMessage("");
        guestbook.setIpInfo("正在查地址");

        myMapper.insertSelective(guestbook);
    }

    @Override
    @Log
    public void updateGuestbook(Guestbook guestbook) {
        myMapper.updateByPrimaryKeySelective(guestbook);
    }

    @Override
    @Log
    public void deleteGuestbookById(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Log
    public Guestbook findGuestbookById(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Guestbook> findGuestbookByPage(int pageNum) {
        Example example = new Example(Guestbook.class);

        example.createCriteria().andEqualTo("status", ArticleStatus.COMPLETE.getStatus()).andEqualTo("isDeleted", AppConstants.IS_DELETED_NO);

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        List<Guestbook> guestbooks = myMapper.selectByExample(example);

        processGuestbooksReplyMessage(guestbooks);

        return guestbooks;
    }

    /**
     * 处理回复信息
     *
     * @param guestbooks
     */
    private void processGuestbooksReplyMessage(List<Guestbook> guestbooks) {
        for (Guestbook guestbook : guestbooks) {
            guestbook.setReplyMessage(MarkdownUtil.markdownToHtml(guestbook.getReplyMessage()));
        }
    }

    @Override
    @Log
    public boolean isQuickWrite(String ip) {
        Example example = new Example(Guestbook.class);
        example.createCriteria().andEqualTo("ip", ip).andGreaterThan("createdTime", DateUtil.plusMinutes(-3));

        return myMapper.selectCountByExample(example) > 0;
    }

    @Override
    @Log
    public void updateGuestbookIpInfo(Long id, String ip) {
        new Thread() {
            public void run() {
                Map<String, String> resultMap = IPUtil.getIpInfo(ip);

                String city = resultMap.get("city");
                if (StringUtils.isEmpty(city)) {
                    city = "未知地";
                }
                city += "网友";

                Guestbook guestbook = new Guestbook();
                guestbook.setId(id);
                guestbook.setIpInfo(city);
                myMapper.updateByPrimaryKeySelective(guestbook);
                log.info("留言的ip信息查询成功");
            }
        }.start();
    }

    @Override
    @Log
    public Guestbook findPrevGuestbook(Long id) {
        Example example = new Example(Guestbook.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andLessThan("id", id);

        example.setOrderByClause("id desc");

        PageHelper.startPage(1, 1);
        List<Guestbook> guestbooks = myMapper.selectByExample(example);

        return guestbooks.isEmpty() ? null : guestbooks.get(0);
    }

    @Override
    @Log
    public Guestbook findNextGuestbook(Long id) {
        Example example = new Example(Guestbook.class);
        Example.Criteria criteria = example.createCriteria();

        criteria.andGreaterThan("id", id);

        example.setOrderByClause("id asc");

        PageHelper.startPage(1, 1);
        List<Guestbook> guestbooks = myMapper.selectByExample(example);

        return guestbooks.isEmpty() ? null : guestbooks.get(0);
    }
}
