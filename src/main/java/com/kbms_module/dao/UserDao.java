package com.kbms_module.dao;


import com.kbms_module.pojo.Collection;
import com.kbms_module.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    /**
     * 根据用户名选择出用户的属性（全部属性）
     * @param username
     * @return
     */
     User selectUserbyname(@Param("username") String username) ;

     User selectUsernamebyEmail(@Param("email")String email);

     User selectUserbyId(int id);

     void insert_user(User user);

     int selectcountbycode(String acode);

     void updateactive(String acode);

     List<Collection> selectAllCollection(Integer userId);
}
