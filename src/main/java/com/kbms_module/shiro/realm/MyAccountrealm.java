package com.kbms_module.shiro.realm;

import com.kbms_module.controller.LoginController;
import com.kbms_module.pojo.AccountProfile;
import com.kbms_module.service.UserService;
import com.kbms_module.shiro.authc.AccountAuthenticationInfo;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by warkey on 2018-02-26.
 * 账号关联不是关联用户，实现及认证又授权
 * relem 查找数据库然后返回安全数据
 */
public class MyAccountrealm extends AuthorizingRealm {
    private final static Logger log= Logger.getLogger(LoginController.class);
    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    //认证，得到认证的信息
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
       //封装正确信息

        UsernamePasswordToken uptoken= (UsernamePasswordToken) authenticationToken;


        //1.查找数据库,对用户名进行认证,封装一个accountProfile信息类，对应一个账户
         AccountProfile account=userService.login(uptoken.getUsername(),String.valueOf(uptoken.getPassword()));
        //2.封装正确的用户和凭证，并添加账户信息对象，自定义SimpleAuthentication
        AccountAuthenticationInfo info = new AccountAuthenticationInfo(uptoken.getPrincipal(), uptoken.getCredentials(), getName());
        info.setProfile(account);




        return info;
    }
}
