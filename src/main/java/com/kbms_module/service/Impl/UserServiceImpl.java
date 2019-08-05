package com.kbms_module.service.Impl;


import com.kbms_module.dao.UserDao;
import com.kbms_module.dao.UserMapper;
import com.kbms_module.pojo.AccountProfile;
import com.kbms_module.pojo.Collection;
import com.kbms_module.pojo.Group;
import com.kbms_module.pojo.User;
import com.kbms_module.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 用户接口的实现类，用来判断用户登录注册的各种情况
 */
@Service
public class UserServiceImpl implements UserService {

   private final Logger log= Logger.getLogger("UserServicImpl.class");
   @Autowired
   private  UserDao  userdao;
   //调用原来自动生成的UserMapper

   @Autowired
    private UserMapper userMapper;

    @Override
    public boolean selectUserbyname(String username,String password)    {//一般与业务功能相关的类建议在service层抛出异常，与业务功能无关的类建议在Controller抛出异常
        //根据用户名来选择出用户的信息
       User u= userdao.selectUserbyname(username);//用户名登录
       User user=userdao.selectUsernamebyEmail(username);//邮箱登录


           //密码要经过处理，密码都是经过MD5加密保存在数据库的，这里要进行解密

           if (u==null&&password.equals(user.getUserPassword()
           )) {
               log.info("用户 " + user.getUserEmail() + " 登录成功 登录时间" + new Date());
               return true;
           }
           else if (user==null&&password.equals(u.getUserPassword())) {
               log.info("用户" +u.getUserName()+ " 登录成功 登录时间"+new Date());
               return true;
           }




        return false;
    }
   /*

   注册的简单验证
    */
    @Override
    public int selectUsernbyUE(String username, String Email) {
        User u=userdao.selectUserbyname(username);
        if (u!=null){
            log.info("存在该用户");
            return 1;
        }
        else{
            u=userdao.selectUsernamebyEmail(Email);
            if (u!=null){
                log.info("存在该邮箱");
                return  2;
            }
            else{
                return  0;
            }
        }

    }

    @Override
    public void insert(User user) {
        userdao.insert_user(user);
    }

    @Override
    public int findcountbyacode(String acode) {
       int count=userdao.selectcountbycode(acode);
       return  count;
    }

    @Override
    public void updateactive(String acode) {
        userdao.updateactive(acode);

    }

    @Override
    public AccountProfile login(String username, String s) {

        return null;
    }

    @Override
    public User selectUsernbyname(String username) {
        User user=userdao.selectUserbyname(username);
        return user;
    }

    @Override
    public List<Group> getusergroup(Integer userId) {

        User user=userMapper.getUserGrouop(userId);
        List<Group> groupList=user.getGroups();
        return groupList;
    }

    @Override
    public List<Collection> selectAllforks(Integer userId) {
        List<Collection> collections=userdao.selectAllCollection(userId);
        return collections;
    }
}
