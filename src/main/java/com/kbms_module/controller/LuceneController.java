package com.kbms_module.controller;

import com.kbms_module.enums.webConstant;
import com.kbms_module.pojo.Btype;
import com.kbms_module.pojo.PageBean;
import com.kbms_module.service.DocService;
import com.kbms_module.service.LuceneService;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

/**
 * Created by warkey on 2018-03-19.
 * 搜索的Controller
 */
@Controller
@RequestMapping("/search")
public class LuceneController {
    @Autowired
    private LuceneService luceneService;
    @Autowired
    private DocService docService;


    @RequestMapping("/doc")
    public ModelAndView searchDoc(@RequestParam(value = "keywords" ,required = false,defaultValue = "")String keywords,@RequestParam(value ="form",required = false)String fromsubmit,@RequestParam(value = "pagenum",required = false,defaultValue = "1")String pagenum,@RequestParam(value="time",required = false)String time,@RequestParam(value = "hot",required = false) String hot) throws ParseException, InvalidTokenOffsetsException, IOException {
        //按照flag的作为标志量，用来来判断提交的方式是Form 表单提交还是window.location.href=来提交
        ModelAndView mav=new ModelAndView();
        Integer currentpage=Integer.valueOf(pagenum);
        String keyword=keywords;
        Integer sort=0;//默认按照id排序
        //查出所有知识的文档的大分类
        List<Btype> btypeList=docService.searchAllBtype();
       if (time!=null){
           sort=1;
           mav.addObject("time",time);//分页需要转入
       }
       if (hot!=null){
           sort=2;
           mav.addObject("hot",hot);//分页需要转入，这里需要转出
       }
        //按照分页查找,默认页面为1
        long start=System.nanoTime();
        PageBean searchListPage=luceneService.getPageSearchList(currentpage, webConstant.SearchListSize,keyword,sort);
        long timecount=System.nanoTime()-start;
        //转换单位为毫秒
        timecount=timecount/1000/1000;
        System.out.println("搜索耗时"+time);
        mav.addObject("searchPage",searchListPage);
        mav.addObject("keywords",keyword);
        mav.addObject("costTime",timecount);
        mav.addObject("btype",btypeList);
        //返回搜索结果页
        mav.setViewName("common/searchList");
        return mav;
    }
}

