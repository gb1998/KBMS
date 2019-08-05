package com.kbms_module.service.Impl;

import com.kbms_module.dao.GroupMapper;
import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.Group;
import com.kbms_module.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by warkey on 2018-02-28.
 */
@Service
public class GroupServiceImpl implements GroupService {
    @Autowired
    private GroupMapper groupMapper;
    @Override
    public List<Group> getgroup(Integer i) {
        List<Group> groups=groupMapper.getlastestgroup(i);
        return groups;
    }

    @Override
    public List<Group> getAllGroup() {
        List<Group> groupList=groupMapper.getAllGroup();
        return groupList;
    }

    @Override
    public Group getUserForGroup(Integer gid) {
        Group usergroup=groupMapper.getUserForGroup(gid);
        return usergroup;
    }

    @Override
    public List<Doc> getDocForGroup(Integer gid) {
        List<Doc>  docgroupList=groupMapper.getDocsbyGid(gid);
        return docgroupList ;
    }

    @Override
    public void createGroup(Group group) {
        groupMapper.createGroup(group);

    }

    @Override
    public void createUserGroup(Integer userId, Integer id) {
        groupMapper.createUserGroup(userId,id);

    }
}
