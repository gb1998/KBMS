package com.kbms_module.controller;

import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.Group;
import com.kbms_module.pojo.User;
import com.kbms_module.service.GroupService;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

import static com.kbms_module.enums.webConstant.IMG_UPLOADTYPE;
import static com.kbms_module.enums.webConstant.MAX_IMAGE_LENGTH;

/**
 * Created by warkey on 2018-03-31.
 * 小组的控制器类
 */
@Controller
public class groupController {
    private Logger log = Logger.getLogger("UploadController.class");
    @Autowired
    private GroupService groupService;

    //查看所有的小组
    @RequestMapping("/groupall")
    public ModelAndView getAllGroup(@RequestParam(value = "page", defaultValue = "1", required = false) Integer page) {
        ModelAndView mav = new ModelAndView();
        List<Group> groupList = groupService.getAllGroup();
        mav.addObject("groupList", groupList);
        // 添加界面跳转
        mav.setViewName("hx_jsp/knowledgeGroup");
        return mav;
    }

    @RequestMapping("/group/{gid}")
    public ModelAndView getGroup(@PathVariable(value = "gid") Integer gid) {
        ModelAndView mav = new ModelAndView();
        //1.小组的所有组员，包括创建者
        Group group = groupService.getUserForGroup(gid);
        User createUser = null;
        //2.找到创建者
        List<User> users = group.getUser();
        for (User u : users) {
            if (u.getUserId() == group.getCreateId()) {
                createUser = u;
            }
        }
        //3.查找到该小组下所有的文档
        List<Doc> groupdocList = groupService.getDocForGroup(gid);
        mav.addObject("createUser", createUser);
        mav.addObject("groupuser", group);
        mav.addObject("groupdoc", groupdocList);
        //添加的试图，跳转页面
        mav.setViewName("hx_jsp/groupContent");
        return mav;
    }

    //新添加小组
    @RequestMapping("/group/add")
    public ModelAndView addGroup(String groupName, String groupPower, String groupTag, String indounces, @RequestParam("imageFile") MultipartFile file, HttpSession session) throws Exception {
        //处理小组
        ModelAndView mav = new ModelAndView();
        Group group = new Group();
        group.setGroupName(groupName);
        //处理图片：
        log.info("进入图片处理界面");
        //下面定义要返回的值
        int error;
        String message;
        String url = null;
        String id = null;
        String fileName = " ";
        //验证图片的大小格式是否满足要求
        Map<String, Object> map = new HashMap<String, Object>();
        String fileid = null;
        String maxLength = MAX_IMAGE_LENGTH;//文件上传的最大大小不超过1000MB
        if (file.getSize() > Integer.valueOf(maxLength)) {
            log.info("图片文件过大");
            throw new Exception("图片大小不能超过" + Integer.valueOf(maxLength) / 1024 + "kb");
        }
        //SpringMVC MultipartFile转化为File
        CommonsMultipartFile cmf = (CommonsMultipartFile) file;
        DiskFileItem item = (DiskFileItem) cmf.getFileItem();
        //如果不存在临时文件
        if (!item.getStoreLocation().exists()) {
            item.write(item.getStoreLocation());//自动导入，一般小于8k的图片不会生成临时文件

        }
        //得到文件名字
        fileName = item.getName();
        //验证文件上传的类型是否为图片,这里图片格式为jpg,jpeg,png,gif,需要转化
        String imgType = IMG_UPLOADTYPE;
        String imgtypes[] = imgType.split(",");
        List<String> listimgType = new ArrayList<String>();
        for (int i = 0; i < imgtypes.length; i++) {
            String temp = imgtypes[i];
            log.info(temp);
            if (temp != null && !temp.equals("") && !temp.equals(" ")) {
                listimgType.add(temp);
                log.info(temp);
            }
        }
        if (!listimgType.contains(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length()))) {
            log.info("上传的不是图片格式");
            error = 1;
            map.put("message", "上传的不是图片格式，请重试");
            throw new Exception("上传的格式错误，你上传的不是图片格式");
            //保存图片并返回，为图片生成唯一的id，不会保存到数据库
        }
        //文件预览的实现
        String imgPath = "E:/imgTest/" + file.getOriginalFilename();
        File m = new File(imgPath);
        if (!m.exists()) {
            m.mkdirs();
        }
        file.transferTo(m);//将上传文件写到服务器上指定的文件
        //指定返回的变量,给前台界面使用，这里可以统一保存到一个地方所有的文件，图片，临时文件并给他们一个记录，表明该图片是谁上传的
        log.info("文件创建成功，保存在零食文件夹中，不需要上传到数据库，不需要保存到数据库");
        String path = "//" + fileName;


        group.setGroupDescirate(indounces);
        group.setGroupHeadimg(path);
        group.setGroupNums(1);
        //插入数据库

        //group.setCreateId();
        //图片不做处理
        User user = null;
        List<User> userList = new ArrayList<User>();
        //取到当前用户
        try {
            user = (User) session.getAttribute("user");
            group.setCreateId(user.getUserId());
            userList.add(user);
            group.setUser(userList);
        } catch (Exception e) {
            log.info("用户名为空");
        }
        //保存到数据库

        group.setGroupTime(new Date());
        groupService.createGroup(group);
        System.out.println("小组创建成功");
        groupService.createUserGroup(user.getUserId(), group.getId());
        mav.setViewName("redirect:/group/" + group.getId());
        return mav;
    }
}


