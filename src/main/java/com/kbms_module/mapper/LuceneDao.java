package com.kbms_module.mapper;

import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.PageBean;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;

import java.io.IOException;

/**
 * Created by warkey on 2018-03-18.
 */
public interface LuceneDao {
    /**
     * 增加索引
     */
    void addIndex(Document document);
    /**
     * 删除索引
     */
    void deleteIndex(String id);
    /**
     * 更新索引
     */

    void updateIndex(Document document) throws IOException;
    /**
     * 搜索根据id 查到与子对应的dcument的索引
     */
    Document findIndexById(String id);

    PageBean findIndex(String keyword, Integer currentpage, Integer searchListSize, Integer sort) throws ParseException, IOException, InvalidTokenOffsetsException;

    /**
     * 为每一篇文章添加索引
     * @param doc
     * @param userName
     * @param fileText
     */
    void addIndexForOneFileDoc(Doc doc, String userName, String fileText);

    String getSummary(Doc doc, long l);
    /**
     * 根据关键字搜索，并且返回搜索后的分页结果
     */





}
