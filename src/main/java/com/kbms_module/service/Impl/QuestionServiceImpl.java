package com.kbms_module.service.Impl;

import com.kbms_module.dao.BtypeMapper;
import com.kbms_module.dao.QuestionMapper;
import com.kbms_module.pojo.*;
import com.kbms_module.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by warkey on 2018-02-28.
 * 问答的业务逻辑
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionmapper;
    @Autowired
    private BtypeMapper btypeMapper;
    @Override
    public List<Question> gethotquestion(Integer i) {
        List<Question> hotQues=questionmapper.getHostQues(i);
        return hotQues;
    }

    @Override
    public List<Btype> questiontype() {
       List<Btype> questiontype=btypeMapper.selectAllbyte();
       return questiontype;
    }

    @Override
    public List<Question> getAllQuestion() {
       List<Question> questionList=questionmapper.geQuestion();
       return questionList;
    }

    @Override
    public PageBean getPageListQuestion(Integer pagenum, Integer pageSize,Integer btypeId, Integer sid) throws PageNumErrorException {
        //分页处理问答
        //实现按大分类页面搜索
        List<Question> BigQuestion=null;
        if (sid == null&&btypeId!=null)
            BigQuestion=questionmapper.getQuestionByBId(btypeId);//根据id得到大分类下的问答
        else if(sid!=null)
            BigQuestion =questionmapper.getQuestionBySId(sid);
        else if (sid==null &&btypeId==null)
        {
            //没有传入大分类和小分类，就默认查找所有的文件
            //查找所有的文档
          BigQuestion=questionmapper.geQuestion();
        }
        int questionCounts=BigQuestion.size();
        //计算总共多页

        int totalPage= (int) Math.ceil(questionCounts*1.0/pageSize);
        if (pagenum>totalPage&&totalPage!=0)//抛异常，参数异常，查找不到该页
        {
            throw  new PageNumErrorException();

        }
        //分页查询数据库显示当前pugnums上面有多少知识
        List<Question>  questionsList=questionmapper.getPageListQustion((pagenum-1)*pageSize,pageSize,btypeId,sid);

        PageBean pageBean=new PageBean(questionCounts,pagenum,pageSize,totalPage,questionsList);
        return pageBean;
    }

    @Override
    public List<Question> selectUsolve(Integer problemnums, Integer btypeId, Integer sid) {
        List<Question> solveProblemList=questionmapper.selectQuestionbyStatus(problemnums,btypeId,sid);

        return solveProblemList;
    }

    @Override
    public Question getQuestionById(Integer qid) {
      //  Question question=questionmapper.selectByPrimaryKey(qid);
        Question question= questionmapper.getQuestionById(qid);
        return question;
    }

    @Override
    public Comments getSureAnswer(Integer qid) {
        Comments coments=questionmapper.getSureAnswer(qid);
        return coments;
    }

    @Override
    public List<Comments> getUsureAnswer(Integer qid) {
        List<Comments> commentsList=questionmapper.getUsureAnswer(qid);
        return commentsList;
    }

    @Override
    public void createQuestion(Question question) {
        questionmapper.createQuestion(question);

    }
}

