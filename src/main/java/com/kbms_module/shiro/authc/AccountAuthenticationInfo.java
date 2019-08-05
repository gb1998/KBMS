package com.kbms_module.shiro.authc;

import com.kbms_module.pojo.AccountProfile;
import org.apache.shiro.authc.SimpleAuthenticationInfo;

/**
 * Created by warkey on 2018-02-26.
 * 封装账户信息对象，
 */
public class AccountAuthenticationInfo extends SimpleAuthenticationInfo {
    private static final long serialVersionUID = 3405356595200877071L;

    private AccountProfile profile;//账号信息对象

    public AccountAuthenticationInfo(){
    }

    public AccountAuthenticationInfo(Object principal, Object credentials, String realmName){
        super(principal, credentials, realmName);
    }

    public AccountProfile getProfile() {
        return profile;
    }

    public void setProfile(AccountProfile profile) {
        this.profile = profile;
    }

}