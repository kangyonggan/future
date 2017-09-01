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
     * 获取留言
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

    /**
     * 三分钟内是否留言了
     *
     * @param ip
     * @return
     */
    boolean isQuickWrite(String ip);

    /**
     * 异步更新ip信息
     *
     * @param id
     * @param ip
     */
    void updateGuestbookIpInfo(Long id, String ip);

    /**
     * 查找上一个留言
     *
     * @param id
     * @return
     */
    Guestbook findPrevGuestbook(Long id);

    /**
     * 查找下一个留言
     *
     * @param id
     * @return
     */
    Guestbook findNextGuestbook(Long id);
}
