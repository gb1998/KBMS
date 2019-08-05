package com.kbms_module.service;

import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.PageBean;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;

import java.io.IOException;

/**
 * Created by warkey on 2018-03-19.
 */
public interface LuceneService {
    /**
     * 根据分页查找关键字
     * @param currentpage
     * @param searchListSize
     * @param keyword
     * @param sort
     * @return
     */
    PageBean getPageSearchList(Integer currentpage, Integer searchListSize, String keyword, Integer sort) throws ParseException, InvalidTokenOffsetsException, IOException;
    /**
     * 创建索引
     */
    public void addindex();
    /**
     * 添加一个索引
     */
    public void addOneindex(Doc d);
    /**
     * 更新索引
     */
    public void updateindex(Doc d);
    /**
     * 删除索引
     */
    public void  deleteindex();

}
