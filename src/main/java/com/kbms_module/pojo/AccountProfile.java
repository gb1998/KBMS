package com.kbms_module.pojo;

/**
 * Created by warkey on 2018-02-26.
 * 添加了角色，消息数量以及激活邮箱的一些属性，以及权限菜单
 *
 */
public class AccountProfile extends  User {
    private static final long serialVersionUID = 1748764917028425871L;

    private int roleId;

    private int activeEmail;

    //权限菜单
   /* private List<AuthMenu> authMenus;
   //系统推送的消息数目
    private BadgesCount badgesCount;*/

    public AccountProfile(long id, String username) {
        super(id, username);
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

  /*  public List<AuthMenu> getAuthMenus() {
        return authMenus;
    }*/

    /**
     * 冒泡排序法，按sort进行排序
     * @param
     */
   /* public void setAuthMenus(List<AuthMenu> authMenus) {
        for (int i = 0; i < authMenus.size(); i++) {
            for (int j = authMenus.size() - 1; j > 0; j--) {
                if (authMenus.get(i).getSort() > authMenus.get(j).getSort()) {
                    AuthMenu temp = authMenus.get(i);
                    authMenus.set(i, authMenus.get(j));
                    authMenus.set(j, temp);
                }
            }
        }
        this.authMenus = authMenus;
    }*/

    public int getActiveEmail() {
        return activeEmail;
    }

    public void setActiveEmail(int activeEmail) {
        this.activeEmail = activeEmail;
    }

   /* public BadgesCount getBadgesCount() {
        return badgesCount;
    }*/

   /* public void setBadgesCount(BadgesCount badgesCount) {
        this.badgesCount = badgesCount;
    }*/

}
