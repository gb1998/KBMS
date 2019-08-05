package com.kbms_module.service;

import com.kbms_module.pojo.AccountProfile;
import com.kbms_module.pojo.Collection;
import com.kbms_module.pojo.Group;
import com.kbms_module.pojo.User;

import java.util.List;

public interface UserService  {
    boolean selectUserbyname(String username,String password) ;
    int selectUsernbyUE (String username,String Email);

    void insert(User user);

    /**
     * 查找acode
     * @param acode
     * @return
     */
    int findcountbyacode(String acode);

    /**
     * 更新acode
     * @param acode
     */
    void updateactive(String acode);

    AccountProfile login(String username, String s);

    /**
     * 查找登录成功的用户信息
     * @param username
     * @return
     */
    User selectUsernbyname(String username);


    /**
     * 根据用户id 选择出所有的族类名
     * @param userId
     * @return
     */
      List<Group> getusergroup(Integer userId);


    /**
     * 得到用户所有的收藏夹
     * @param userId
     * @return
     */
    List<Collection> selectAllforks(Integer userId);
}
