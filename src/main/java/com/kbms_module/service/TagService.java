package com.kbms_module.service;

import com.kbms_module.pojo.Tags;

/**
 * Created by warkey on 2018-03-16.
 * 标签服务接口
 */
public interface  TagService {
    /**
     * 根据名字查找标签类
     * @param t
     * @return
     */
     Tags selectTagbyname(String t);

    /**
     * 更新标签的发贴数量
     * @param tid
     * @param tagnum
     */
    void updatePost(int tid, int tagnum);

    /**
     * 插入标签
     * @param t
     */


    void createTags(Tags tagg);
}
