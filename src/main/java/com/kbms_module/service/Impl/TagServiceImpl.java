package com.kbms_module.service.Impl;

import com.kbms_module.dao.TagsMapper;
import com.kbms_module.pojo.Tags;
import com.kbms_module.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by warkey on 2018-03-16.
 */
@Service
public class TagServiceImpl implements TagService {


    @Autowired
    private TagsMapper tagsMapper;
    @Override
    public Tags selectTagbyname(String t) {
        Tags tag=tagsMapper.selectTagbyname(t);
        return tag;
    }

    @Override
    public void updatePost(int tid, int tagnum) {
        //更新书铁数量
        tagsMapper.updatePost(tid,tagnum);



    }




    @Override
    public void createTags(Tags tagg) {
        tagsMapper.createTag(tagg);

    }
}
