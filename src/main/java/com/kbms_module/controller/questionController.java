package com.kbms_module.controller;

import com.kbms_module.enums.webConstant;
import com.kbms_module.pojo.*;
import com.kbms_module.service.CommentsService;
import com.kbms_module.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by warkey on 2018-03-27.
 * 问答的控制器
 */
@Controller

public class questionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private CommentsService commentsService;
    @RequestMapping ("questionall")
    public ModelAndView getAllQuestion(@RequestParam(value = "pagenum",defaultValue = "1")Integer pagenum)
    {
        ModelAndView mav=new ModelAndView();
        //1.查出大分类和小分类
        List<Btype> btypeList=questionService.questiontype();
        //2.查出来所有的问题
        List<Question> allquestion=questionService.getAllQuestion();

        //2.找出最新三条没有被解决的问题的信息问题默认按照时间按照分类下的最新时间
        Integer problemnums=webConstant.UsolveProblem;
        List<Question >  usolveProblem=questionService.selectUsolve(problemnums,null,null);

        //分页bid和sid都为空
        PageBean pageAllquestion=null;
        Integer pageSize=webConstant.PageListSize;
        try {
            pageAllquestion=questionService.getPageListQuestion(pagenum,pageSize,null,null);
        } catch (PageNumErrorException e) {
            e.printStackTrace();
        }
        mav.addObject("noSolveProblem" , usolveProblem);
        mav.addObject("pageListQuestion",pageAllquestion);
        mav.addObject("btypelist",btypeList);
        mav.addObject("fromIndex" , true);
        /*mav.addObject("allquestion",allquestion);*/
        mav.setViewName("hx_jsp/knowledgeQuestionList");
        return mav;
    }
    //1问题的列表页会分很多类别的
    @RequestMapping("/questionlist")
    @ResponseBody
    public ModelAndView  getQuestionList(@RequestParam(value="BtypeId" )Integer BtypeId,@RequestParam(value="sid" ,required = false)Integer sid,@RequestParam(value="pagenum",required = false,defaultValue = "1")Integer pagenum)
    {
        ModelAndView mav=new ModelAndView();
        //1.找到所有的大小分类然后找到所有的小分类的问答数量
        //2.列出所有分类下的列表页

        //1.查出大分类和小分类
        //1.查出大分类和小分类
        List<Btype> btypeList=questionService.questiontype();
        mav.addObject("Bid",BtypeId);
        mav.addObject("Sid",sid);
        //2.根据大id 小id 分别查找问题
        //2.1id下查找具体大id的所有类的问题
        //2.2 id下查找具体的所有问题
        int pageSize= webConstant.PageListSize;
        //
        //PageBean 包含List<Question> 而question 包含User
        //PageBean pageListDoc = docService.getPageListDoc(pagenum, pageSize, BtypeId,sid);
        PageBean pageListQuestion= null;
        try {
            pageListQuestion = questionService.getPageListQuestion(pagenum,pageSize,BtypeId,sid);
        } catch (PageNumErrorException e) {
            e.printStackTrace();
        }
        //2.找出最新三条没有被解决的问题的信息问题默认按照时间按照分类下的最新时间
        Integer problemnums=webConstant.UsolveProblem;
        List<Question >  usolveProblem=questionService.selectUsolve(problemnums,BtypeId,sid);
        mav.addObject("pageListQuestion",pageListQuestion);
        mav.addObject("btypelist",btypeList);
        mav.addObject("noSolveProblem",usolveProblem);
        mav.setViewName("hx_jsp/knowledgeQuestionList");//到具体类别页面
        return mav;
    }
    @RequestMapping("/question/{qid}")
    public ModelAndView getPageforProblem(@PathVariable("qid") Integer qid)
    {
        //根据一篇id 得到具体的问题
        ModelAndView mav=new ModelAndView();
        Question question=questionService.getQuestionById(qid);
        //得到问题下的回答，回答及评论
        Comments comments=null;
        if(question.getStatus()==1)
        {
            //查找出被采纳的评论
             //comments= questionService.getSureAnswer(qid);
             comments=commentsService.getSureCommentsForQuestion(qid);

             mav.addObject("sureanswer",comments);
        }
        //查找出所有没有被采纳的评论
        List<Comments> ucommentsList=commentsService.getUsureCommentsForQuestion(qid);
        mav.addObject("ucommentsList",ucommentsList);
        mav.addObject("question" , question);
        mav.setViewName("hx_jsp/questionContent");
        return mav ;
    }



}
