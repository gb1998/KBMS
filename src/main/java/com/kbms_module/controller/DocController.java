package com.kbms_module.controller;

import com.kbms_module.pojo.*;
import com.kbms_module.service.CommentsService;
import com.kbms_module.service.DocService;
import com.kbms_module.service.ZanService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by warkey on 2018-03-07.知识的查看
 */
@Controller
@RequestMapping("/doc")
public class DocController {
    private final static Logger log= Logger.getLogger(indexController.class);
    @Resource
    private CommentsService commentService;
    @Resource
    private DocService docService;
    @Resource
    private ZanService zanService;
    //查看文档具体的文档
    //搜索所有的文档
    @RequestMapping("/search")
    @ResponseBody
    public List<Doc> getAllDoc( HttpSession session ,String keyword)
    {

        List <Doc> docList=null;
        docList=docService.searchBykeywords(keyword);
        return docList;

    }
    @RequestMapping("/view/{id}")
    public ModelAndView viewDoc(@PathVariable("id")int id , HttpSession session)
    {
        ModelAndView mav=new ModelAndView();
        //根据id 查找doc
        Doc doc=docService.selectDocbyId(id);
        mav.addObject("doc",doc);
        //要显示该文档里面的全部评论（所以文档里面要封装评论，评论里面在显示用户的头像id用户名，目前只有做二级评论）
        //评论（回复也是楼中评论）
        //1.加载评论
        List<Comments> comments=commentService.findComment(id,null);

        //2.加载楼中评论（也就是回复)
        List<Replys> replysList =commentService.findReplys(id,null);
        //2.1加载该知识的所有标签
        List<Tags> tagsList=null;
        try {
         tagsList = docService.getTagsListByid(id);
        }catch (Exception e)
        {
            log.info("该知识下没有标签");
        }
        log.info(String.valueOf(doc.getStypeId()));
        //3.加载同类知识(是同一个小类型的其他文章甚至可以做是同一标签下的文章）
        //doc.getStypeId();//小分类id
        List<Doc> docList=docService.getDocByStypeId( doc.getStypeId());
        //4.加载关联知识
        //4.1传入得到的文档id,根据文档id 查找得到文档列表List<Doc>
        //1.查找文档是id主动关联的
        List<Doc> firstdoc=docService.getReleadDoc(id);
        //2.查找文档id是被被动关联的
        List<Doc> seconddoc=docService.getBeReleadDoc(id);

        //3.整合到一起
        List <Doc> totalDoc =new ArrayList<>();
        //4 转入userId 查看用户是否点赞了.如果点赞了或者没有点赞设置不同的变量前台显示不同的图标
        User user= (User) session.getAttribute("user");
        if (user==null)
        {
            mav.addObject("usercode",0);
        }
        else
        {
            //判断用户是否对该扁文章点赞
            List<Zan> list=zanService.getdianzan(user.getUserId(),id);
            if (list!=null && list.size()>0)
            {
                log.info("你已经点赞了");
                mav.addObject("usercode",1);

            }
            else
            {
                log.info("你还没有点过赞");
                mav.addObject("usercode",0);
            }

        }
        for (Doc f:firstdoc)
        {
            totalDoc.add(f);
        }
        for (Doc s:seconddoc)
        {

            totalDoc.add(s);
        }
        mav.addObject("releadDoc",totalDoc);
        mav.addObject("commentList",comments);
        mav.addObject("sameDoc",docList);
        mav.addObject("tagsList",tagsList);
        mav.addObject("replyList",replysList);
        //加载该文档下所有的资源，根据文档id查出所有的文件集合
        List<File> docfilelist=null;
        try {
            if (doc.getTypeId() == 2) {
                docfilelist = docService.getFilesForDocById(id);

                mav.addObject("filelist", docfilelist);
                //跳转到知识预览界面
                mav.setViewName("hx_jsp/docfilepage");

            }
            else {
                mav.setViewName("view/docContent");
            }
        }catch ( Exception e)
        {
           log.info("该文件下没有file");
           e.printStackTrace();
        }


        return mav;
    }
    //浏览知识的数量增加一个
    @RequestMapping("/lookadd")
    @ResponseBody
    public Integer increaseView(HttpServletRequest request)
    {
        Integer docid= Integer.valueOf(request.getParameter("docId"));
        //根据知识得到文档
        Doc doc =docService.selectDocbyId(docid);
        Integer currentNums=doc.getVisitnums();
        //更新数量
        doc.setVisitnums(currentNums+1);
        //更新数据库
        docService.updateLooknumsById(docid,currentNums+1);
        return  (currentNums+1);

    }
    //点赞文档
    @RequestMapping("/zanadd")
    @ResponseBody
    public Map dianzan(@RequestParam("uid")Integer uid, @RequestParam("did") Integer did)
    {
        Map map =new HashMap();
        //遍历整个表
        Doc d=docService.selectDocbyId(did);
        Integer dianzanNums=d.getFavers();
        List<Zan> list=zanService.getdianzan(uid,did);
        if (list!=null && list.size()>0)
        {
            log.info("你已经点赞了");
            map.put("msg","你已经点过赞了");
        }
        else
        {
             zanService.insertzan(uid,did);
             log.info("点赞成功");
             //
             docService.updatedianzanNums(did,dianzanNums+1);
             dianzanNums=dianzanNums+1;
             d.setFavers(dianzanNums);
             map.put("msg","点赞成功");
        }
        map.put("dianzanNums",dianzanNums);
          return map;
    }
}



