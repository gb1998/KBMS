package com.kbms_module.dao;

import com.kbms_module.pojo.Doc;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by warkey on 2018-02-27.
 * 文档接口
 */
public interface DocDao {
    /**
     * 获取最新i条文档,单个参数可以不绑定
     * @param i
     * @return
     */
    List<Doc> getnewDoc(Integer i);

    List<Doc> gethotDoc(Integer i);

    List<Doc> getDocs();

    Doc getDocById(int i);


    /**
     * 根据那的得到分页
     *
     * @param
     * @param pagenum
     * @param pageSize
     * @param sid
     * @return
     */
    List<Doc> getPageListDoc(@Param("pagenum") Integer pagenum, @Param("pageSize") Integer pageSize, @Param("BId") Integer bid, @Param("Sid") Integer sid);

    /**
     * 得到id 根据大分类id
     * @param btypeId
     * @return
     */
    List<Doc> getDotsByBtypeId(Integer btypeId);

    /**
     * 根据小分类得到知识数
     * @param sid
     * @return
     */
    List<Doc> getDotsByStypeId(Integer sid);

    /**
     * 更新文档的浏览人数
     * @param docid
     * @param i
     */
    void updateLookNumsbyId(@Param("docid") Integer docid, @Param("nums") int i);


    /**
     * 更新点赞人数
     * @param did
     * @param i
     */
    void updateZanNumsbyId(@Param("did") Integer did, @Param("nums") int i);

    /**
     * 插入新的文档的记录
     * @param title
     * @param authorId
     * @param createtime
     * @param btypeId
     * @param stypeId
     * @param summary
     * @param typeId
     * @param previewurl
     * @param groupid
     */


    /**
     * 直接插入一个文档
     * @param doc
     */
    void createDoc(Doc doc);

    /**
     * 创建关联文档
     * @param id
     * @param did
     * @return
     */
    int createLinkDoc(@Param("id") Integer id, @Param("did") Integer did);

    /**
     * 得到一盘文档的所有的资源文档
     * @param id
     * @return
     */
     public Doc  getFilesForDoc(Integer id);

    List<Doc> getAllPage(@Param("pagenum") int i, @Param("pageSize") int pageListSize);

    /**
     * 独立知识
     * @param fdoc
     */
    void createFileDoc(Doc fdoc);

    /**
     * 根据uuid得到Doc
     * @param uuid
     * @return
     */
    Doc getDocByUUid(String uuid);

    List<Doc> selectDocbyKeyword(String keyword);

    List<Doc> getDocByUId(Integer userId, Integer page, Integer pagesize);
}
