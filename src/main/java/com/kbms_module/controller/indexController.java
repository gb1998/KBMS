package com.kbms_module.controller;

import com.kbms_module.enums.webConstant;
import com.kbms_module.pojo.*;
import com.kbms_module.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

import static com.kbms_module.enums.webConstant.CONTAINER_PATH;

/**
 * Created by warkey on 2018-02-26.
 * 检索首页
 */
@Controller
public class indexController {
    private final static Logger log= Logger.getLogger(indexController.class);
    @Autowired
    private DocService docservice;
    @Autowired
    private LuceneService luceneService;
    @Autowired
    private CommentsService commentservice;
    @Autowired
    private QuestionService questionservice;
    @Autowired
    private GroupService groupservice;
    @Autowired
    private UserService userService;

    //上传文档,加载到文档哪里的界面去
     @RequestMapping("/goDocFrom")
     public ModelAndView getDocPage(HttpSession session)
     {
         ModelAndView mav=new ModelAndView();
         //1.得到所有的大分类和小分类
         List<Btype> btypeList=docservice.searchAllBtype();

         //2.得到用户加入的所有的小组
         User user=null;
         try{
             user= (User) session.getAttribute("user");
             log.info(user.getUserId());
         }catch (Exception e)
         {
             log.info("用户session 为空，当前没有登录");
         }
         //3.得到所有的知识
         List<Doc> doclist=docservice.getDocs();

         List<Group> groups=userService.getusergroup(user.getUserId());
         mav.addObject("btypelist",btypeList);
         mav.addObject("group",groups);
         mav.addObject("alldoc",doclist);
         //跳转到发表文档的页面
         mav.setViewName("upload/createDoc");
         return mav;
     }
     //提交问题的界面
    @RequestMapping("/goQuestionForm")
    public ModelAndView getQuestionPage()
    {
        ModelAndView mav=new ModelAndView();
        //得到所有的大分类和小分类
        List<Btype> btypeList=docservice.searchAllBtype();
        //跳转到提交问题的界面
        mav.addObject("btypelist",btypeList);
        //问题的提交界面
        mav.setViewName("hx_jsp/createQuestion");
        return  mav;

    }
    //跳转到创建小组的界面
    @RequestMapping("/goGroupFrom")
    public ModelAndView getGroupCreatePage()
    {
         ModelAndView mav=new ModelAndView();
         mav.setViewName("hx_jsp/createGroup");
         return  mav;
    }
    //上传资源文件
    @RequestMapping("/uoloadfile")
    public ModelAndView  getUploadpage(HttpSession session)
    {
        ModelAndView mav=new ModelAndView();
        //1.得到所有的大分类和小分类
        List<Btype> btypeList=docservice.searchAllBtype();

        //2.得到用户加入的所有的小组
        User user=null;
        try{
            user= (User) session.getAttribute("user");
            log.info(user.getUserId());
        }catch (Exception e)
        {
            log.info("用户session 为空，当前没有登录");
        }


        List<Group> groups=userService.getusergroup(user.getUserId());
        mav.addObject("btypelist",btypeList);
        mav.addObject("group",groups);
        mav.setViewName("upload/createResources");
       return mav;
    }


    @RequestMapping(value= {"/", "/index"})
    public ModelAndView showHomePage(Integer pagenum, HttpSession session, HttpServletRequest request)
    {
        ModelAndView mav=new ModelAndView();
        //首页不分页
        //1.加载知识大分类和小分类
        List<Btype> btypes=docservice.searchAllBtype();//搜索所有的大分类
        mav.addObject("kind",btypes);

        //2.加载最多八条最新知识按照知识的时间排序，获取知识的类型是文档还是资源以及知识的时间和知识的标题
        List<Doc> newestDoc =docservice.getnewDoc(8);//获取前八条(可能少与八条）
        mav.addObject("newestDoc",newestDoc);


        //3.加载最多八条热门知识按照点击量和浏览量
        List<Doc> hotDoc =docservice.getHotDoc(8);
        mav.addObject("hotDoc",hotDoc);
        //        //4.加载最多2条最新问答评论1.选择出最新的两个评论（问答），并选择出对应的问答

        List<Comments> newComments=commentservice.getComments(2);//得到最新评论不限类型得到主题标题时间用户的头像id,查找2条记录
        //评论里面封装用户对象，可以将用户信息一并查出以及跳转链接
        mav.addObject("newComm",newComments);
        //查找评论关联的最新问答
        //5.加载最多两个热门问答，根据问答的热度系数日期转带
        List<Question>  hotquestion =questionservice.gethotquestion(2);
        mav.addObject("hotques",hotquestion);
        //6.加载最多两个知识小组按照间，最新的放上面
        List<Group>  groups=groupservice.getgroup(2);
        mav.addObject("groups",groups);
        //7.加载最多三项推荐知识（随机推荐）
        List<Doc> docs=docservice.getDocs();
        List<Doc> threeDoc=new ArrayList<>();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            Random random = new Random();//random 随机数去重
            Set<Integer> sets = new HashSet<>();//hasahset有序去有序
            for (int i = 0; i < 100; i++)//100为产生3个不重负数据最大次数
            {
                int j = random.nextInt(docs.size()) + 1 + (1 << 16);//[1,docs.size]
                log.info("随机生成的数id" + j);
                sets.add(j);
                if (sets.size() == 3) {

                    for (Integer s : sets) {
                        s = s - (1 << 16);//去有序
                        log.info("随机生成的数id" + s);
                        Doc doc = docservice.selectDocbyId(s);
                        threeDoc.add(doc);

                    }
                    break;
                }

            }
        }
        else
        {
            //用户登陆的时候，智能推送相关知识，对用户推荐三遍知识
            threeDoc=docservice.getReCommennd(user.getUserId(),3);

        }
        if (null ==CONTAINER_PATH) {
            String root = request.getSession().getServletContext().getRealPath("/");
            CONTAINER_PATH = root;
        }
        webConstant.loadRootPath();
        mav.addObject("randomdoc",threeDoc);
        mav.setViewName("home/index");
        return mav;
    }
    @RequestMapping("/lunindex")
    public void  crateIndexLuncene()
    {
        luceneService.addindex();
    }

}
