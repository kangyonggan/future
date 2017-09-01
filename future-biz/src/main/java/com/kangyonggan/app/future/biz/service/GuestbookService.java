package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Guestbook;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/1/17
 */
public interface GuestbookService {

    /**
     * 搜索留言
     *
     * @param pageNum
     * @param status
     * @return
     */
    List<Guestbook> searchGuestbook(int pageNum, String status);

    /**
     * 保存留言
     *
     * @param guestbook
     */
    void saveGuestbook(Guestbook guestbook);

    /**
     * 更新留言
     *
     * @param guestbook
     */
    void updateGuestbook(Guestbook guestbook);

    /**
     * 删除留言
     *
     * @param id
     */
    void deleteGuestbookById(Long id);

    /**
     * 获取留言（包含逻辑删除的）
     *
     * @param id
     * @return
     */
    Guestbook getGuestbook(Long id);

    /**
     * 获取留言（不包含逻辑删除的）
     *
     * @param id
     * @return
     */
    Guestbook findGuestbookById(Long id);

    /**
     * 分页查找留言
     *
     * @param pageNum
     * @return
     */
    List<Guestbook> findGuestbookByPage(int pageNum);
}
