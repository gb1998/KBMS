package com.kbms_module.dao;


import com.kbms_module.pojo.Doc;
import org.apache.ibatis.annotations.Param;

/**
 * 知识标签处理类
 */
public interface DocTagMapper {
    /**
     * 为知识打上标签
     */
    public void insertDocTag(@Param("did") Integer did, @Param("tid") Integer tid);
    /**
     * 根据一篇知识得到所有的标签并封装成一个对象级联查询
     */
    public Doc getDocByidWithTags(Integer did);



}