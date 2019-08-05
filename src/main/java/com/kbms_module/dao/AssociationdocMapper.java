package com.kbms_module.dao;


import com.kbms_module.pojo.Doc;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 关联知识的接口
 */

public interface AssociationdocMapper {

    /**
     * 新加的关联
     */

    /**
     * 查询已经关联的知识根据id
     */
    List<Doc> selectreleaddoc(@Param("newid") Integer newid, @Param("oldid") Integer oldid);
    /**
     * 查找主动关联的
     */
    List<Doc> getFirstDoc(Integer newid);

    /**
     * 查找被动关联的
     */
     List<Doc> getSenodDoc(Integer oldid);
}