package com.kangyonggan.app.future.biz.service;

import com.kangyonggan.app.future.model.vo.Section;

import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/8/15 0015
 */
public interface SectionService {

    /**
     * 更新小说的章节
     *
     * @param code
     * @return
     */
    boolean updateBookSections(int code);

    /**
     * 更新所有小说章节
     *
     * @return
     */
    void updateSections();

    /**
     * 查找书籍所有章节
     *
     * @param code
     * @return
     */
    List<Section> findBookSections(int code);
}
