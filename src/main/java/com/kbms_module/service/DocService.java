package com.kbms_module.service;

import com.kbms_module.pojo.*;


import java.util.List;

/**
 * Created by warkey on 2018-02-26.
 */
public interface DocService {
    /**
     * 查找所有的知识的大分类
     * @return
     */
    public List<Btype> searchAllBtype() ;

    /**
     * 获得最新的知识
     * @param i
     * @return
     */
    List<Doc> getnewDoc(Integer i);

    /**
     * 最热的知识按系数
     * @param i
     * @return
     */

    List<Doc> getHotDoc(Integer i);

    /**
     * 得到所有的文档
     * @return
     */
    List<Doc> getDocs();

    /**
     * 根据id查找数据库
     * @param i
     * @return
     */
    Doc selectDocbyId(int i);

     PageBean getPageListDoc(Integer pagenum, int pageSize, Integer btypeId, Integer sid) throws PageNumErrorException;

   /*

    更新浏览量根据id
    */
    void updateLooknumsById(Integer docid, int i);

    /*
    得到标签
     */
    List<Tags> getTagsListByid(int id);

    /**
     * 得到小分类下的文章
     * @param stypeId
     * @return
     */
    List<Doc> getDocByStypeId(Integer stypeId);


    /**
     * 得到主动关联的文章
     * @param id
     * @return
     */
    List<Doc> getReleadDoc(int id);

    /**
     * 得到被关联的文章列表
     * @param id
     * @return
     */
    List<Doc> getBeReleadDoc(int id);

    void updatedianzanNums(Integer did, int i);


    /**
     * 创建文档doc
     * @param doc
     */
    void createDoc(Doc doc);

    /**
     * 为文档添加附件
     * @param filelist
     */
    void createFileForDoc(File filelist);

    /**
     * 为文档添加附件
     * @param id
     * @param id1
     */
    void insertDocFile(Integer id, Integer id1);

    /**
     * 建立文档和标签的关联知识
     * @param id
     * @param id1
     */


    void insertDocFile(Filedoc filedoc);

    void insertDocTag(Integer id, Integer id1);

    /**
     * 创建关联知识
     * @param id
     * @param integer
     * @return
     */
    int createLinkDoc(Integer id, Integer integer);

    /**
     * 查出一篇文档所有的资源
     * @param id
     * @return
     */
    List<File> getFilesForDocById(Integer id);

    List<Classification> getClassificationByParentId(Long fileClassId);

    List<Classification> getFatherClassesById(Long fileClassId);

    Classification getClassificationById(Long fileClassId);

    /**
     * 得到所有的子节点
     * @param fileClassId
     * @return
     */
    List<Classification> getAllChildClassesById(Long fileClassId);

    PageBean getPageListDocByClassId(Integer pageNo, int pageListSize, Long fileClassId) throws PageNumErrorException;

    /**
     * 独立知识的创建
     * @param fdoc
     */
    void insertFileForDoc(Doc fdoc);

    /**
     * 得到智能推荐的知识
     * @param userId
     * @param i
     * @return
     */

    List<Doc> getReCommennd(Integer userId, int i);

    /**
     * 关键字搜索
     * @param keyword
     * @return
     */
    List<Doc> searchBykeywords(String keyword);

    /**
     * 更新文章数
     * @param bdocnums
     * @param sdocnums
     * @param integer
     * @param valueOf
     */
    void updatenums(Integer bdocnums, Integer sdocnums, Integer integer, Integer valueOf);

    List<Doc> selectDocByUserID(Integer userId, Integer page, Integer pagesize);
}
