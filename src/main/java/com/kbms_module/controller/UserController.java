package com.kbms_module.controller;

import com.kbms_module.enums.webConstant;
import com.kbms_module.pojo.*;
import com.kbms_module.pojo.Collection;
import com.kbms_module.service.CollectionService;
import com.kbms_module.service.DocService;
import com.kbms_module.service.ForkInfoService;
import com.kbms_module.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;


/**
 * 用户controller 这里包括注册和其他的一些处理,包括发送邮箱的一些处理，邮箱的激活
 */
@Controller
@RequestMapping("user")
public class UserController {
    private Logger log = Logger.getLogger("UserController");
    @Autowired
    private UserService userservice;
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private ForkInfoService forkInfoService;
    @Autowired
    private DocService docService;
     /**
     * 用户收藏的全部文件夹
     * @return
     */

    @RequestMapping( value="/findAllByUserId",method = RequestMethod.GET)
    @ResponseBody
    public Map findAllCollectionbyUserid(HttpSession session)
    {
        Map map=new HashMap();
        User user= (User) session.getAttribute("user");
        List<Collection> forkList=new ArrayList<>();
        if (null!=user)
        {
            forkList=userservice.selectAllforks(user.getUserId());
        }
        if (0==forkList.size())
        {
            //默认没有收藏夹

            //新建一个名字为“我的收藏”收藏夹
            collectionService.createCollection(user.getUserName()+"的收藏",user.getUserId());
            forkList=userservice.selectAllforks(user.getUserId());
        }
        map.put("len",forkList.size());
        map.put("data",forkList);
        return map;
    }
    /***
     * 我的空间处理
     */
    @RequestMapping(value="/mySpace", method=RequestMethod.GET)
    public ModelAndView mySpace(HttpSession session)
    {
        ModelAndView mav=new ModelAndView();
        User user= (User) session.getAttribute("user");//取得用户信息
       List<Doc> userDocList=docService.selectDocByUserID(user.getUserId(),1,1000);
        //查看我的空间首先调至我的空间的文档管理中心
        mav.addObject("docList",userDocList);
        mav.addObject("user",user);

        mav.setViewName("view/mySpace_docinfo");
        return mav;


    }
    @RequestMapping(value ="/querydocInfo",method=RequestMethod.GET)
    @ResponseBody
    public ConcurrentMap<String, Object>queryAllDocByUID(Integer page,Integer limit,HttpSession session)
    {
       ConcurrentMap<String, Object> concurrentMap = new ConcurrentHashMap<String,Object>();
        User user= (User) session.getAttribute("user");//取得用户信息User user= (User) session.getAttribute("user");//取得用户信息
        List<Doc> allDocList =docService.selectDocByUserID(user.getUserId(),1,1000);
        List<Doc> userDocList=docService.selectDocByUserID(user.getUserId(),page,limit);
        concurrentMap.put("count", allDocList.size());
        concurrentMap.put("data", userDocList);
        concurrentMap.put("code", 0);
        concurrentMap.put("msg", "成功");
        return concurrentMap;


    }

    //判断用户是否收藏了资源
   // @RequestMapping ("judgeFork")
    /**
     * 判断是否收藏过
     *
     * @param forkInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/judgeFork", method = RequestMethod.POST)
    public @ResponseBody Map judgeFork(Fork forkInfo, HttpSession session) {
        Map map = new HashMap();
        User user = (User) session.getAttribute("user");
        //开始默认没有收藏
        ///JsonResult jr = new JsonResult(true, "未收藏");
        map.put("success", true);
        map.put("error", "没有收藏");
        //得到用户所有关注的
        List<Fork> forkInfos = forkInfoService.findByCoolectionId(user.getUserId());
        for (Fork f : forkInfos) {
            if (f.getFileId().equals(forkInfo.getFileId())) {
                //jr.setError("收藏失败,你已经收藏过该文件!");
                //   jr.setSuccess(false);
                // jr.setData(f.getForkId());
                map.put("error", "收藏失败,你已经收藏过该文件!");
                map.put("success", false);
                map.put("data", f.getFileId());
            }
        }
        return map;
    }
    //插入收藏与删除收藏
    /**
     * 添加一个收藏
     *
     * @param forkInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/insertFork", method = RequestMethod.POST)
    public @ResponseBody Map insertFork(Fork forkInfo, HttpSession session) {
        Map map =new HashMap();
        User user = (User) session.getAttribute("user");
      //  JsonResult jr = new JsonResult(true, "收藏成功");
        map.put("success", true);
        map.put("error", "没有收藏");
        forkInfo.setForkTime(new Date());
        forkInfoService.insert(forkInfo);
        //返回自动产生的id
      //  Long forkId = forkInfoService.findByFileId(forkInfo.getFileId(), user.getUserId()).getForkId();
       // jr.setData(forkId);
        map.put("data",forkInfo.getFileId());
        return map;
    }
    /**
     * 删除一个收藏
     *
     * @param forkInfo
     * @param session
     * @return
     */
   @RequestMapping(value = "/deleteFork", method = RequestMethod.POST)
    public @ResponseBody Map deleteFork(Long forkId, HttpSession session) {
       Map map=new HashMap();
       map.put("success",true);
       map.put("error","删除成功");
      //  JsonResult jr = new JsonResult(true, "删除成功");
        forkInfoService.delete(forkId);
        return map;
    }


    /**
     * 修改一个收藏
     *
     * @param forkInfo
     * @param session
     * @return
     */
   /* @RequestMapping(value = "/modifyFork", method = RequestMethod.POST)
    public @ResponseBody JsonResult modifyFork(ForkInfo forkInfo, HttpSession session) {
        JsonResult jr = new JsonResult(true, "修改成功");
        forkInfoService.modify(forkInfo);
        return jr;
    }*/

    /**
     * 得到知识库根目录下所有的信息
     * @return
     */
    @RequestMapping("public/{fileClassId}/{pageno}")
    public String publicResource(Model model, @PathVariable("fileClassId") Long fileClassId,
                                 @PathVariable("pageno") Integer pageNo) throws PageNumErrorException {
        //子类别
        List<Classification> list = docService.getClassificationByParentId(fileClassId);
        // 得到所有父节点链表
        List<Classification> plist = docService.getFatherClassesById(fileClassId);
        Classification c = docService.getClassificationById(fileClassId);
        //分页查找知识的集合
        PageBean  pageBean=docService.getPageListDocByClassId(pageNo, webConstant.PageListSize,fileClassId);
        //  PageInfo<FileInfoVO>  page = fileManageService.getAllChildFiles(pageNo, fileClassId);
        model.addAttribute("classi", c);
        //下一层所有的子类
        model.addAttribute("list", list);
        //父链
        model.addAttribute("plist", plist);
        List page=new ArrayList();
       model.addAttribute("page", pageBean);
        return "home/public";
    }
    //跳到注册页面
    @RequestMapping("registerPage")
    public ModelAndView getRegisterPage() {
        //注册成功跳往哪里
        ModelAndView mav = new ModelAndView();
        mav.setViewName("user/loginRegister");
        return mav;
    }
    //验证用邮箱名是否存在
    @RequestMapping("/is_email")
    @ResponseBody
    public Map <String,Boolean> IshasEmail(@RequestParam("checkEmail") String username){
        //验证邮箱
        int flag=userservice.selectUsernbyUE(null,username);
        Map<String,Boolean>  map=new HashMap<String,Boolean>()  ;
        if (flag==2){
            log.info("邮箱存在");
           map.put("checkEmail",true);
        }
        else
        {
            map.put("checkEmail",false);
        }

        return map;
    }
    //验证注册时候用户名是否已经存在，存在返回true,不存在返回false
    @RequestMapping("check_name")
    @ResponseBody
   public Map <String,Boolean> checkName(@RequestParam("username")String username){
        Map <String ,Boolean> map=new HashMap<>();
        int flag=userservice.selectUsernbyUE(username,null);
        if (flag==1)
        {
            log.info("用户名存在");
            map.put("checkUsername", true);
        }
        else{
            map.put("checkUsername",false);
        }
        return  map;
    }
    //注册界面提交,验证后发送邮件
    @RequestMapping("/registerSubmit")
    public  ModelAndView RegSubmit(@RequestParam(value="yourName") String username, @RequestParam(value="password") String password, @RequestParam(value="email") String email) {
        //设置注册用户的默认头像
        ModelAndView mav = new ModelAndView();
        User user = new User();
        //注册的业务逻辑处理1.查询username是否存在，查询emil是否已经被注册，选择用户上传的头像，用户编辑个人信息。查询到用户邮箱没有注册，然后给目标邮箱发送邮件，用户用来激活账号，账号激活与不激活都是可以登录的
        //邮箱和账号都应该没有被注册
        log.info("用户开始注册");//注册成功，跳转到登录页
        user.setUserName(username);
        user.setUserPassword(password);
        user.setUserEmail(email);
        user.setUserActive(0);//默认没有激活
        user.setUserImgid("/default.jpg");
        user.setUserAcode(UUID.randomUUID().toString().replace("-", ""));//随机生成acode 且唯一
        userservice.insert(user);
        log.info("开始发送邮件");
        mav.setViewName("user/loginRegister");
        new MySendMailThread(user).start();


        return mav;
    }
    /**
     * 邮箱激活
     *
     * @param request
     * @param acode
     * @return
     */
    @RequestMapping("/emailactive")
    public String emailactive(HttpServletRequest request, String acode) {
        int count = userservice.findcountbyacode(acode);
        request.setAttribute("count", count);
        if (count == 0) {
            //count=0;没有找到acode
            request.setAttribute("activeerror", "激活失败，请检查你的链接地址，地址不存在或者已经激活");
        } else {
            //更新
            log.info("激活成功");
            request.setAttribute("activesuccess", "激活成功");
            userservice.updateactive(acode);
        }

        return "user/activeResult";
    }
    /**
     * 用户注销退出登录Session
     */
    @RequestMapping("/exit")
    public String exit(HttpSession session)
    {
        //消废session
        session.invalidate();
        return "redirect:/index.jsp";

    }




}

