package com.kbms_module.service;

import com.kbms_module.pojo.*;

import java.util.List;

/**
 * Created by warkey on 2018-02-28.
 * 问答接口
 */

public interface QuestionService {
    /**
     * 热门问答
     * @param i
     * @return
     */
    List<Question> gethotquestion(Integer i);
    /**
     * 得到问答的小分类然后得到问答的大分类
     */
    List<Btype> questiontype();

    /**
     * 查出所有的问题
     * @return
     */

    List<Question> getAllQuestion();

    /**
     * 封装每一页的问题
     * @param pagenum
     * @param btypeId
     * @param sid
     * @return
     */
    PageBean getPageListQuestion(Integer pagenum,Integer pageSize, Integer btypeId, Integer sid) throws PageNumErrorException;

    /**
     * 最新三条没有被解决的问题
     *
     * @param problemnums
     * @param btypeId
     * @param sid
     * @return
     */
    List<Question> selectUsolve(Integer problemnums, Integer btypeId, Integer sid);

    Question getQuestionById(Integer qid);

    /**
     * 得到确定的答案
     * @return
     * @param qid
     */
    Comments getSureAnswer(Integer qid);

    /**
     * 得到没有被采纳的问答
     * @param qid
     * @return
     */
    List<Comments> getUsureAnswer(Integer qid);

    /**
     * 创建问题
     * @param question
     */
    void createQuestion(Question question);
}
