package com.kbms_module.service;

import com.kbms_module.pojo.Comments;
import com.kbms_module.pojo.Replys;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by warkey on 2018-02-28.
 * 评论服务接口
 */
public interface CommentsService {

    List<Comments> getComments(Integer i);

    /*
    得到评论
     */
    List<Comments> findComment(Integer did,Integer uid);

    List<Replys> findReplys(Integer id, Integer cid);

    /**
     * 插入评论
     * @param did
     * @param uid
     * @param content
     * @param timestamp
     * @return
     */
    int addcomment(Integer did, Integer uid, String content, Timestamp timestamp);

    /**
     * 得到被采纳的回答的问题
     * @param qid
     * @return
     */
    Comments getSureCommentsForQuestion(Integer qid);

    /**
     * 所有没有被采纳的问题
     * @param qid
     * @return
     */
    List<Comments> getUsureCommentsForQuestion(Integer qid);
}
