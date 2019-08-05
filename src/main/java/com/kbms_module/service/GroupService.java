package com.kbms_module.service;

import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.Group;

import java.util.List;

/**
 * Created by warkey on 2018-02-28.
 */
public interface GroupService {
    List<Group> getgroup(Integer i);

    //得到所有的小组
    List<Group> getAllGroup();
    //包装组类成员信息
    Group getUserForGroup(Integer gid);
    //得到小组下所有的分类
    List<Doc> getDocForGroup(Integer gid);

    void createGroup(Group group);

    void createUserGroup(Integer userId, Integer id);
}
