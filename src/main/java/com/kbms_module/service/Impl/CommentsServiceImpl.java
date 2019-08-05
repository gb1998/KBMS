package com.kbms_module.service.Impl;

import com.kbms_module.dao.CommentsMapper;
import com.kbms_module.pojo.Comments;
import com.kbms_module.pojo.Replys;
import com.kbms_module.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by warkey on 2018-02-28.
 */
@Service
public class CommentsServiceImpl implements CommentsService{
    @Autowired
    private CommentsMapper comments;
    @Override
    public List<Comments> getComments(Integer i) {
        //得到最新评论
        List<Comments> lastestComments=comments.getLastestComments(i);


        return lastestComments;
    }

    @Override
    public List<Comments> findComment(Integer did, Integer uid) {
        //根据知识id得到评论
        List<Comments> commentList=comments.getCommentsById(did,uid);
        return commentList;
    }

    @Override
    public List<Replys> findReplys(Integer id, Integer cid) {
        //根据知识id 得到楼中评论
        List<Replys> replysList=comments.getReplyById(id,cid);

        return replysList;
    }

    @Override
    public int addcomment(Integer did, Integer uid, String content, Timestamp timestamp) {
        int result=comments.addComment(did,uid,content,timestamp);
        return result;
    }

    @Override
    public Comments getSureCommentsForQuestion(Integer qid) {
        Comments answer=comments.getSureAnswerForQuestion(qid);
        return answer;
    }

    @Override
    public List<Comments> getUsureCommentsForQuestion(Integer qid) {
        List<Comments> commentsList=comments.getUsureAnswerForQuestion(qid);
        return  commentsList;
    }
}
