package com.kbms_module.controller;

/**
 * 登录注册的controller，使用shiro框架安全认证授权
 */


import com.kbms_module.enums.webConstant;
import com.kbms_module.pojo.User;
import com.kbms_module.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/login")
@Controller
public class LoginController {
     private final static Logger log= Logger.getLogger(LoginController.class);
     //用户服务的接口
     @Autowired
     private UserService userservice;
    /**
     * 进入登录页面
     */
    @RequestMapping("/webPage")
    public ModelAndView login(HttpSession session, HttpServletRequest request)
    {

        //需要将登陆前的页面地址存入session会话中，然后登录成功之后回到该页面
         String url=request.getHeader("Referer");//用来获取来源页面地址并保存到session
         session.setAttribute(webConstant.SESSION_FROM_URL,url);
         ModelAndView mav=new ModelAndView();
         mav.setViewName("/user/loginRegister");
         return  mav;
    }
    /**
     * 验证登录名不存在
     */
    @RequestMapping("/checkusername")
    @ResponseBody
    public Map <String,Boolean> usernoexist(@RequestParam("username") String username)
    {
        Map<String,Boolean> map =new HashMap<>();
        int flag=userservice.selectUsernbyUE(username,null);
            if (flag==1){
                log.info("存在用户");
                map.put("checkUsername",true);
            }
            else{
                log.info("不存在该账号的用户，验证邮箱");
                flag=userservice.selectUsernbyUE(null,username);
                if (flag==2)
                {
                    log.info("存在邮箱用户，可以登录");
                    map.put("checkUsername",true);
                }
                else
                map.put("checkUsername",false);
            }

     return  map;
    }

    /**
     * 登录请求的提交
     */
    @RequestMapping("/websubmit")
    public  ModelAndView webLoginCommit(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, HttpServletRequest request){
        //调用逻辑来判断用户名与密码是否存在
        Map message=new HashMap<String,String>();
        ModelAndView mav=new ModelAndView();
        if(userservice.selectUserbyname(username,password)){//具体逻辑放在接口层实现，这里表示登录成功，错误由异常报错
                /**
                 * 登录成功之后需要找到登录前的页面进行跳转，并吧所以信息注入session
                 */
               User user=userservice.selectUsernbyname(username);
               session.setAttribute("user",user);
               String goUrl=null;//标志着跳转
               if(goUrl==null){
                   //要去哪里，一般登录的话是去先前过来的网址，这里留做一种特殊情况也就是被拦截的访问的界面需要验证是否有权限

                   goUrl=(String)session.getAttribute(webConstant.SESSION_GO_URL);
                   session.removeAttribute(webConstant.SESSION_GO_URL);
               }
               if (goUrl==null){
                   //从哪里来
                   goUrl= (String) session.getAttribute(webConstant.SESSION_FROM_URL);
               }
               if(goUrl!=null&&goUrl.indexOf("login/webPage")>0){
                   //如果用户一登录就进入登录界面的话，那么就去默认的首页
                   goUrl=null;
               }
               if (goUrl==null){
                   //去默认首页
                   goUrl="/index";
               }
            //要跳转到默认首页或者登录前的页面,这里可以封装一个json的模型类，，会对jsp的返回以及其他类型的返回，没必要封装
              mav.setViewName("redirect:"+goUrl);
             return mav;
            }
            else
            {
                //登录失败,这里登录失败为密码错误
                log.info("密码错误");
                message.put("data","登录失败，密码错误");
                message.put("code",0);
                mav.addObject("map",message);
                mav.setViewName("user/loginRegister");
                return  mav;
            }
            }
        }

   /* private void loginIntoSession(HttpSession session, Object currentIp, String username) {
    }
*/
    /*private Object getCurrentIp(HttpServletRequest request) {
    }*/



