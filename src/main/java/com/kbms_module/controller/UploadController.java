package com.kbms_module.controller;

import com.kbms_module.dao.BtypeMapper;
import com.kbms_module.dao.StypeMapper;
import com.kbms_module.enums.webConstant;
import com.kbms_module.pojo.*;
import com.kbms_module.service.*;
import com.kbms_module.util.Htmlutil;
import com.kbms_module.util.StringValueUtil;
import com.kbms_module.util.TextRankUtil;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

import static com.kbms_module.enums.webConstant.IMG_UPLOADTYPE;
import static com.kbms_module.enums.webConstant.MAX_IMAGE_LENGTH;


/**
 * 上传文件的处理类
 */
@Controller
@RequestMapping("upload")
public class UploadController {
    private Logger log = Logger.getLogger("UploadController.class");
    @Autowired
    private DocService docService;
    @Autowired
    private TagService tagService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private FileService fileService;
    @Autowired
    private LuceneService luceneService;
    @Autowired
    private StypeMapper stypeMapper;
    @Autowired
    private BtypeMapper btypeMapper;

    /**
     * 处理图片
     */
    @RequestMapping("/uploadImg")
    @ResponseBody
    public Map<String,Object>uploadImg(@RequestParam(value="imgFile", required=false) MultipartFile file, HttpServletRequest request, HttpSession session)
    {
        //需要验证图片的大小，图片的格式
        log.info("进入图片处理界面");
        //下面定义要返回的值
        int error;
        String message;
        String url=null;
        String id=null;
        String fileName=" ";
        //验证图片的大小格式是否满足要求
        Map <String,Object> map=new HashMap<String,Object>();
        ModelAndView mav=new ModelAndView();
        try{
            String fileid=null;
            String maxLength=MAX_IMAGE_LENGTH;//文件上传的最大大小不超过1000MB
            if(file.getSize()>Integer.valueOf(maxLength)){
                log.info("图片文件过大");
                throw new Exception("图片大小不能超过"+Integer.valueOf(maxLength)/1024+"kb");
            }
            //SpringMVC MultipartFile转化为File
            CommonsMultipartFile cmf= (CommonsMultipartFile) file;
            DiskFileItem item = (DiskFileItem) cmf.getFileItem();
            //如果不存在临时文件
            if (!item.getStoreLocation().exists()){
                item.write(item.getStoreLocation());//自动导入，一般小于8k的图片不会生成临时文件

            }
            //得到文件名字
            fileName=item.getName();
            //验证文件上传的类型是否为图片,这里图片格式为jpg,jpeg,png,gif,需要转化
            String imgType=IMG_UPLOADTYPE;
            String imgtypes[]=imgType.split(",");
            List<String> listimgType=new ArrayList<String>();
            for (int i=0;i<imgtypes.length;i++){
                String temp=imgtypes[i];
                log.info(temp);
                if (temp!=null&&!temp.equals("")&&!temp.equals(" "))
                {
                    listimgType.add(temp);
                    log.info(temp);
                }
            }
            if(!listimgType.contains(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1,file.getOriginalFilename().length()))){
            log.info("上传的不是图片格式");
            error=1;
            map.put("message","上传的不是图片格式，请重试");
            throw new Exception("上传的格式错误，你上传的不是图片格式");
            //保存图片并返回，为图片生成唯一的id，不会保存到数据库
            }
            //文件预览的实现
             String imgPath="E:/imgTest/"+file.getOriginalFilename();
             File m=new File(imgPath);
             if(!m.exists()){
                 m.mkdirs();
             }
             file.transferTo(m);//将上传文件写到服务器上指定的文件
            //指定返回的变量,给前台界面使用，这里可以统一保存到一个地方所有的文件，图片，临时文件并给他们一个记录，表明该图片是谁上传的
            log.info("文件创建成功，保存在零食文件夹中，不需要上传到数据库，不需要保存到数据库");
            String path="/upload/"+fileName;
            //mav.setViewName("url",path);
            error=0;//表示成功
            map.put("error",0);
            map.put("id",1);
            map.put("message","成功");
            map.put("url",path);
            return map;
        }catch (Exception e){
            e.getMessage();
        }
        return map;
    }
    /**
     * 提交问题
     */
    @RequestMapping("/questionadd")
    public String createQuestion(String title,String stypeId,String typeBigId,String content,@RequestParam("imageFile")MultipartFile fe,HttpSession session)
    {
        //插入一个问题
        Question question=new Question();
        question.setTitle(title);
        question.setpKindid(Integer.valueOf(stypeId));
        question.setBid(Integer.valueOf(typeBigId));
        question.setContent(content);
        //图片不做处理
        User user=null;
        //取到当前用户
        try {
            user = (User) session.getAttribute("user");
        }catch (Exception e)
        {
            log.info("用户名为空");
        }
        question.setUseid(user.getUserId());
        question.setUser(user);
        //时间
        question.setPosttime(new Timestamp(new Date().getTime()));
        questionService.createQuestion(question);
        //跳转到刚刚发布到问题的界面
        //question.getId();
        return "view/";
    }
    /**
     * 文档Doc 的上传
     */
    @RequestMapping("/docadd")
    public ModelAndView  createDoc(HttpServletRequest request,HttpServletResponse response,String knowtitle,String stypeId,String typeBigId,String knowtags,@RequestParam("imageFile")MultipartFile fe,String grouptype,String writetype,String readtype,String content,HttpSession session, String[] guanlianId)
    {
        ModelAndView mav=new ModelAndView();
        //0.处理预览图
        Map<String, Object> map = uploadImg(fe, request, session);
        String url= (String) map.get("url");
        //1.创建文档
        Doc doc =new Doc();
        doc.setTitle(knowtitle);
        User user=null;
        //取到当前用户
        try {
            user = (User) session.getAttribute("user");
        }catch (Exception e)
        {
            log.info("用户名为空");
        }
        doc.setAuthorId(user.getUserId());
        doc.setBtypeId(Integer.valueOf(typeBigId));
        doc.setStypeId(Integer.valueOf(stypeId));
        //设值大小类型
        Btype b=btypeMapper.selectTypebyId(Integer.valueOf(typeBigId));
        Stype s=stypeMapper.selectById(Integer.valueOf(stypeId));
        doc.setContent(content);
        doc.setTypeId(1);//添加的类别为1表明是文档
        doc.setGroupid(Integer.valueOf(grouptype));
        doc.setStype(s);
        doc.setBtype(b);
        //取得当前的日期
        doc.setCreatetime(new Timestamp(new Date().getTime()));
        //设置预览图的地址
        doc.setPreviewurl(url);


        String con= Htmlutil.toHtml(content);
        //提取前50个字为摘要
        String summary=con.substring(0,50);
        doc.setSummary(summary);
        log.info("返回的主键为"+doc.getId());
        //添加关联知识
        //1，加载所有的知识
         docService.createDoc(doc);
        List<Doc> linkDocs=docService.getDocs();
        //2.绑定该文章所关联的所有文章
         for (String linkid:guanlianId)
         {
             //Doc linkDoc=docService.selectDocbyId(Integer.valueOf(linkid));
             int result=docService.createLinkDoc(doc.getId(),Integer.valueOf(linkid));//插入关联知识，成功的话返回1，失败的话返回0
         }
        //在发表成功后跳转到刚刚发表的文档id 的界面
        //对标签实现的处理
        String tag[]=knowtags.split(",");
        Tags tagg;
        //遍历查找标签是否存在，如果存在就增加post再查找是否关联知识，没有就添加如果标签没有出现就直接在标签表和标签文档关联
        for (String t:tag)
          {
            try
            {
                 tagg=tagService.selectTagbyname(t);
                 int tagnum=tagg.getPosts();
                 int tid=tagg.getId();
                 tagnum=tagnum+1;
                 tagg.setPosts(tagnum);
                tagService.updatePost(tid,tagnum);
                 System.out.println("1223");

            } catch (NullPointerException  e)
            {
                //主键自增，插入标题
                tagg=new Tags();
                tagg.setName(t);
                tagService.createTags(tagg);
            }
             log.info(tagg.getId());
             log.info(doc.getId());
             docService.insertDocTag(doc.getId(),tagg.getId());
             //大分类下和小分类的数量都增加1更新
              Integer bdocnums=doc.getBtype().getKnums();
              Integer sdocnums=doc.getStype().getkNums();
              bdocnums=bdocnums+1;
              sdocnums=sdocnums+1;
              doc.getBtype().setKnums(bdocnums);
              doc.getStype().setkNums(sdocnums);
              docService.updatenums(bdocnums,sdocnums,Integer.valueOf(typeBigId),Integer.valueOf(stypeId));
              //新 添加索引
             luceneService.addOneindex(doc);
             //错别字识别

             //自动提取页面关键字
              List<Score> keywords = TextRankUtil.keywords(con);
              //提取前三个
              List< Score> key=new ArrayList<>();
              for (int i=0;i<3;i++)
              {
                 Score s2=keywords.get(i);
                 key.add(s2);

              }
              mav.addObject("keywordList",key);
          }
          mav.setViewName("redirect:/doc/view/"+doc.getId());
        return  mav;
    }
    /**
     * 文件资源的上传
     */
    @RequestMapping("/fileadd")
    public String  createResources(HttpServletRequest request, HttpServletResponse response,@RequestParam("file-1") MultipartFile[] file,String knowtitle,String stypeId,String typeBigId,String knowtags,@RequestParam("imgFile") MultipartFile fe,String grouptype,String writetype,String readtype,String content,HttpSession session) throws  Exception
    {
        //处理标签.id都为自增的主键
        //0.处理预览图
        Map<String, Object> map = uploadImg(fe, request, session);
        String url= (String) map.get("url");
        //1.创建文档
        Doc doc =new Doc();
        doc.setTitle(knowtitle);
        User user=null;
        //取到当前用户
        try {
            user = (User) session.getAttribute("user");
        }catch (Exception e)
        {
            log.info("用户名为空");
        }
        doc.setAuthorId(user.getUserId());
        doc.setBtypeId(Integer.valueOf(typeBigId));
        doc.setStypeId(Integer.valueOf(stypeId));

        //doc.setContent(content);
        doc.setSummary(content);
        doc.setTypeId(2);//添加的类别为2表明是资源文件
        doc.setGroupid(Integer.valueOf(grouptype));
        //取得当前的日期
        doc.setCreatetime(new Timestamp(new Date().getTime()));
        //设置预览图的地址
        doc.setPreviewurl(url);
        docService.createDoc(doc);
        //设值大小类型
        Btype b=btypeMapper.selectTypebyId(Integer.valueOf(typeBigId));
        Stype s=stypeMapper.selectById(Integer.valueOf(stypeId));
        doc.setStype(s);
        doc.setBtype(b);
        doc.setContent("你上传的是资源文件");

        Integer bdocnums=doc.getBtype().getKnums();
        Integer sdocnums=doc.getStype().getkNums();
        bdocnums=bdocnums+1;
        sdocnums=sdocnums+1;
        doc.getBtype().setKnums(bdocnums);
        doc.getStype().setkNums(sdocnums);
        docService.updatenums(bdocnums,sdocnums, Integer.valueOf(typeBigId), Integer.valueOf(stypeId));
        //新添加索引
        luceneService.addOneindex(doc);

        log.info("返回的主键为"+doc.getId());
        com.kbms_module.pojo.File filelist=new com.kbms_module.pojo.File();
        //2.为文档添加附件,文件附件id也是自增的
        String useFilePath="user/"+user.getUserId()+"/files/";
        //定义上传文件的
        for(MultipartFile f:file) {
            //需要将每一个文档资源都保存到服务器
             //为每一个都需要分配到Uuid然后还需要存储到数据库
            final String uuid= StringValueUtil.getUUID();
            //file也为自增的
            String fileName=f.getOriginalFilename();
            fileName = fileName.substring(0, fileName.lastIndexOf("."));
            //得到文件的阔藏民
            String suffix=f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf(".")+1);
            //文件的保存在服务器的位置
            String filePath= webConstant.ROOT_PATH+useFilePath+uuid+"."+suffix;
            //保存到服务器
            FileUtils.writeByteArrayToFile(new File(filePath),f.getBytes());
            log.info("保存到服务器成功");
            filelist.setTitle(fileName);//得到文件名要去出后缀
            filelist.setCreatetime(new Timestamp(new Date().getTime()));//创建时间
            filelist.setLen((int) f.getSize());
            filelist.setExname(suffix);
            filelist.setFileuuid(uuid);
            filelist.setCusername(user.getUserName());
            //资源文件的描述
            filelist.setDir(doc.getSummary());
            //数据库里
            filelist.setFilepath(useFilePath+uuid);
            filelist.setFilestate(2);
            //插入文档与资源
            docService.createFileForDoc(filelist);
           //为每一个资源与文档挂上钩
            Filedoc filedoc=new Filedoc();
            filedoc.setDocid(doc.getId());
            filedoc.setFileid(filelist.getId());
            docService.insertDocFile(filedoc);

            //为每一个资源文件单独建立一个Doc 便于查找 类型为3
            Doc fdoc=new Doc();
            fdoc.setTypeId(3);
            Btype fb=btypeMapper.selectTypebyId(Integer.valueOf(typeBigId));
            Stype fs=stypeMapper.selectById(Integer.valueOf(stypeId));
            fdoc.setStype(fs);
            fdoc.setBtype(fb);
            fdoc.setTitle(filelist.getTitle());
            fdoc.setAuthorId(user.getUserId());
            fdoc.setCreatetime(new Date());
            fdoc.setBtypeId(Integer.valueOf(typeBigId));
            fdoc.setStypeId(Integer.valueOf(stypeId));
            //doc.setContent(content);
           // fdoc.setSummary(content);
            fdoc.setSummary(" ");//这是简要介绍，自动提、取
            fdoc.setGroupid(Integer.valueOf(grouptype));
            fdoc.setDocFuuid(filelist.getFileuuid());
            fdoc.setDocFextname(filelist.getExname());
            fdoc.setDocFpath(filelist.getFilepath());
            //fdoc.setDocFextname(filelist.getFilepath());
            docService.insertFileForDoc(fdoc);
            Integer bnum=fdoc.getBtype().getKnums();
            Integer snum=fdoc.getStype().getkNums();
            bnum=bnum+1;
            snum=snum+1;
            doc.getBtype().setKnums(bnum);
            doc.getStype().setkNums(snum);
            docService.updatenums(bdocnums,sdocnums, Integer.valueOf(typeBigId), Integer.valueOf(stypeId));
            //新 添加索引
            luceneService.addOneindex(doc);
            //可以将文件保存到数据库里面
          //  docService.createFileforDoc();
            //3.将文件进行转化为pdf文件，进行转化，新开一个线程处理,用线程来处理，不然特别慢
            new Thread() {
                public void run() {
                    try {
                        fileService.translateFile(uuid);
                    } catch (IOException e) {
                        log.error(uuid+"文件转换失败");
                    }
                };
            }.start();
         /* try{
              fileService.translateFile(uuid);
          }catch (IOException e)
          {
              log.error(uuid+"文件处理对象");
          }*/

        }
        //在发表成功后跳转到刚刚发表的文档id 的界面
        //对标签实现的处理
         String tag[]=knowtags.split(",");
         Tags tagg;
        //遍历查找标签是否存在，如果存在就增加post再查找是否关联知识，没有就添加如果标签没有出现就直接在标签表和标签文档关联
         for (String t:tag)
         {
          try
          {
               tagg=tagService.selectTagbyname(t);
              //得到标签的数量
              int tagnum=tagg.getPosts();//该标签的数量
              int tid=tagg.getId();
              //数量加一
              tagnum=tagnum+1;
              tagg.setPosts(tagnum);
              tagService.updatePost(tid,tagnum);
              //需要从新计算热度

          }catch (Exception e)
          {
              //主键自增，插入标题
              tagg=new Tags();
              tagg.setName(t);
              tagService.createTags(tagg);
          }
             log.info(tagg.getId());
             log.info(doc.getId());
             docService.insertDocTag(doc.getId(),tagg.getId());
        }
        return "redirect:/doc/view/"+doc.getId();
    }


}
