package com.kbms_module.service.Impl;

import com.kbms_module.dao.ZanMapper;
import com.kbms_module.pojo.Zan;
import com.kbms_module.service.ZanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by warkey on 2018-03-12.
 * 点赞服务
 */
@Service
public class ZanServiceImpl implements ZanService {
    @Autowired
    private ZanMapper zanMapper;

    @Override
    public List<Zan> getdianzan(Integer uid, Integer did) {
        List<Zan> list= zanMapper.getDianzan(uid,did);
        return list;
    }

    @Override
    public void insertzan(Integer uid, Integer did) {
        zanMapper.insertdianzan(uid,did);

    }
}
