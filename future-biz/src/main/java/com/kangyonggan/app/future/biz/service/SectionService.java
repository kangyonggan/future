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

    /**
     * 查找书籍最新章节
     *
     * @param bookCode
     * @return
     */
    Section findLastSectionByBookCode(int bookCode);

    /**
     * 查找章节详情
     *
     * @param code
     * @return
     */
    Section findSectionByCode(int code);

    /**
     * 分页查找小说章节
     *
     * @param code
     * @param pageNum
     * @return
     */
    List<Section> findBookSections(int code, int pageNum);

    /**
     * 查找书籍第一章
     *
     * @param bookCode
     * @return
     */
    Section findBookFirstSection(int bookCode);
}
