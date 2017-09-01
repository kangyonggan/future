package com.kangyonggan.app.future.biz.service.impl;

import com.github.pagehelper.PageHelper;
import com.kangyonggan.app.future.biz.service.GuestbookService;
import com.kangyonggan.app.future.model.constants.AppConstants;
import com.kangyonggan.app.future.model.vo.Guestbook;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/1/17
 */
@Service
public class GuestbookServiceImpl extends BaseService<Guestbook> implements GuestbookService {

    @Override
    public List<Guestbook> searchGuestbook(int pageNum, String status) {
        Example example = new Example(Guestbook.class);

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }

    @Override
    public void saveGuestbook(Guestbook guestbook) {

    }

    @Override
    public void updateGuestbook(Guestbook guestbook) {

    }

    @Override
    public void deleteGuestbookById(Long id) {

    }

    @Override
    public Guestbook getGuestbook(Long id) {
        return null;
    }

    @Override
    public Guestbook findGuestbookById(Long id) {
        return null;
    }

    @Override
    public List<Guestbook> findGuestbookByPage(int pageNum) {
        return null;
    }
}
