package com.kbms_module.service.Impl;


import com.kbms_module.dao.*;
import com.kbms_module.pojo.*;
import com.kbms_module.service.DocService;
import com.kbms_module.util.MahoutRecommender;
import org.apache.log4j.Logger;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by warkey on 2018-02-26.
 */
@Service
public class DocServiceImpl implements DocService {
    private final Logger log= Logger.getLogger("DocServiceImpl");
    @Autowired
    private BtypeMapper btypeMapper;
    @Autowired
    private DocDao docdao;//文档接口
    @Autowired
    private DocTagMapper docTagMapper;//文档标签接口
    @Autowired
    private AssociationdocMapper associationdocMapper;//相关资源接口
    @Autowired
    private FileMapper fileMapper;//附件接口
    @Autowired
    private StypeMapper stypeMapper;
    @Autowired
    private FiledocMapper filedocMapper;//文档附件接口
    @Autowired
    private ClassificationMapper classificationMapper;//类别接口构成颗数的
    @Override
    public List<Btype> searchAllBtype() {
       List<Btype> lb=btypeMapper.selectAllbyte();
       return lb;

    }

    @Override
    public List<Doc> getnewDoc(Integer i) {
        List<Doc> newDoc=docdao.getnewDoc(i);
        return newDoc;
    }

    @Override
    public List<Doc> getHotDoc(Integer i) {
       List<Doc> hotDoc=docdao.gethotDoc(i);
       return hotDoc;
    }

    @Override
    public List<Doc> getDocs() {
        List<Doc> docs=docdao.getDocs();
        return docs;
    }

    @Override
    public Doc selectDocbyId(int i) {
        Doc d=docdao.getDocById(i);
        return d;
    }

    @Override
    public PageBean getPageListDoc(Integer pagenum, int pageSize, Integer btypeId, Integer sid) throws PageNumErrorException {
        //实现按大分类页面搜索
        List<Doc> BigDoc=null;
        if (sid == null&&btypeId!=null)
            BigDoc=docdao.getDotsByBtypeId(btypeId);//根据id得到分类的文章
        else if(sid!=null)
            BigDoc=docdao.getDotsByStypeId(sid);
        else
        {
            //查找所有的文档
            BigDoc=docdao.getDocs();
        }
        int docCounts=BigDoc.size();
        //计算总贡多页
        int totalPage= (int) Math.ceil(docCounts*1.0/pageSize);
        if (pagenum>totalPage&&totalPage!=0)//抛异常，参数异常，查找不到该页
        {
            throw  new PageNumErrorException();

        }
        //分页查询数据库显示当前pugnums上面有多少知识
        List<Doc>  docList=docdao.getPageListDoc((pagenum-1)*pageSize,pageSize,btypeId,sid);

        PageBean pageBean=new PageBean(docCounts,pagenum,pageSize,totalPage,docList);
        return pageBean;
    }

    @Override

    public void updateLooknumsById(Integer docid, int i) {
        docdao.updateLookNumsbyId(docid,i);

    }

    @Override
    public List<Tags> getTagsListByid(int id) {
        Doc doc =null;
        doc =docTagMapper.getDocByidWithTags(id);
        List<Tags> tagsList= doc.getTagsList();
       return tagsList;

    }

    @Override
    public List<Doc> getDocByStypeId(Integer stypeId) {
        List<Doc> docList=docdao.getDotsByStypeId(stypeId);
        return docList;
    }

    @Override
    public List<Doc> getReleadDoc(int id) {
       List<Doc> first=associationdocMapper.getFirstDoc(id);
        return first;
    }

    @Override
    public List<Doc> getBeReleadDoc(int id) {
        List<Doc> second=associationdocMapper.getSenodDoc(id);
        return second;
    }

    @Override
    public void updatedianzanNums(Integer did, int i) {
        docdao.updateZanNumsbyId(did,i);
    }

    @Override
    public void createDoc(Doc doc) {
        //建立doc
       // docdao.createDoc(doc.getTitle(),doc.getAuthorId(),doc.getCreatetime(),doc.getBtypeId(),doc.getStypeId(),doc.getSummary(),doc.getTypeId(),doc.getPreviewurl(),doc.getGroupid());
        docdao.createDoc(doc);
    }


    @Override
    public void createFileForDoc(File filelist) {
        //建立附件信息
        fileMapper.createFile(filelist);

    }

    @Override
    public void insertDocFile(Integer id, Integer id1) {

    }


    @Override
    public void insertDocFile(Filedoc filedoc) {
        filedocMapper.createFileForDoc(filedoc);

    }

    @Override
    public void insertDocTag(Integer id, Integer id1) {
        docTagMapper.insertDocTag(id,id1);

    }

    @Override
    public int createLinkDoc(Integer id, Integer did) {
        int result=docdao.createLinkDoc(id,did);
      return result;
    }

    @Override
    public List<File> getFilesForDocById(Integer id) {


        Doc doc=null;
        doc=docdao.getFilesForDoc(id);
        List<File> files=null;
        // System.out.println(doc);
        if(doc.getTypeId()==2) {
          files = doc.getFileList();
        }
        return files;
    }

    @Override
    public List<Classification> getClassificationByParentId(Long fileClassId) {
        //得到一层的所有的子类别
        return  classificationMapper.getClassificationByParentId(fileClassId);
    }

    @Override
    public List<Classification> getFatherClassesById(Long fileClassId) {
        //得到一个节点的父连
        Classification c = null;
        List<Classification> list = new ArrayList<>();
        c = classificationMapper.selectByPrimaryKey(fileClassId);
        list.add(c);
        while (null != c.getParentId()) {
            c = classificationMapper.selectByPrimaryKey(c.getParentId());
            list.add(0, c);
        }
        return list;
    }
    @Override
    public Classification getClassificationById(Long fileClassId) {


        return classificationMapper.selectByPrimaryKey(fileClassId);

    }

    @Override
    public List<Classification> getAllChildClassesById(Long fileClassId) {
        List<Classification> list = new ArrayList<>();
        Classification c = classificationMapper.selectByPrimaryKey(fileClassId);
        list.add(c);
        //递归查找一层所有的子节点
        getChildClass(list, c);
        return list;
    }
    //根据分类来查找知识数，这里的classId 要么是大分类的id 要么是小分类的id
    @Override
    public PageBean getPageListDocByClassId(Integer pageNo, int pageListSize, Long fileClassId) throws PageNumErrorException {
        //1.规定id 30之前为大id ,30之后的为小id
        List<Doc> docSum=null;
        Integer classId=fileClassId.intValue();
        if(fileClassId<30)
        {
            if (fileClassId==1)
            {
                docSum=docdao.getDocs();
            }
            else
            docSum=docdao.getDotsByBtypeId(classId);
        }
        else
            docSum=docdao.getDotsByStypeId(classId);
        int docCounts=docSum.size();
        //计算总贡多页
        int totalPage= (int) Math.ceil(docCounts*1.0/pageListSize);
        if (pageNo>totalPage&&totalPage!=0)//抛异常，参数异常，查找不到该页
        {
            throw  new PageNumErrorException();
        }
        //分页查询数据库显示当前pugnums上面有多少知识
        List<Doc>  docList=null;
        if (fileClassId<30)
        {
            if (fileClassId==1) {
                //查找出所有的文档分页
                docList = docdao.getAllPage((pageNo-1)*pageListSize,pageListSize);
            }
            else
            docList=docdao.getPageListDoc((pageNo-1)*pageListSize,pageListSize,classId,null);

        }
         else
             docList=docdao.getPageListDoc((pageNo-1)*pageListSize,pageListSize,null,classId);
        PageBean pageBean=new PageBean(docCounts,pageNo,pageListSize,totalPage,docList);
        return pageBean;
    }

    @Override
    public void insertFileForDoc(Doc fdoc) {
        docdao.createFileDoc(fdoc);

    }

    @Override
    public List<Doc> getReCommennd(Integer userId, int i) {
        List<Doc> listdoc=new ArrayList<>();
        //基于用户的协同过滤算法
        try{
            List<RecommendedItem> recomList= MahoutRecommender.UserCFRcommender(userId,i);
             for(RecommendedItem r:recomList)
             {
                Doc d= docdao.getDocById((int) r.getItemID());
                listdoc.add(d);
             }
        }catch(Exception e)
        {
        }
        return listdoc;
    }

    @Override
    public void updatenums(Integer bdocnums, Integer sdocnums, Integer bid, Integer sid) {
        btypeMapper.updatednums(bdocnums,bid);
        stypeMapper.uodatenums(sdocnums,sid);
    }

    @Override
    public List<Doc> selectDocByUserID(Integer userId, Integer page, Integer pagesize) {
        Integer pagebeginNum=(page-1)*pagesize;
        List<Doc > l=docdao.getDocByUId(userId,pagebeginNum,pagesize);
        return l;
    }

    @Override
    public List<Doc> searchBykeywords(String keyword) {
        List<Doc> docList=docdao.selectDocbyKeyword(keyword);
        return docList;
    }

    private List<Classification>  getChildClass(List<Classification> list, Classification cf) {
        List<Classification> li = classificationMapper.findOneChildById(cf.getClassificationId());
        if (li.size() <= 0) {
            return list;
        }
        for (Classification c : li) {
            list.add(c);
            getChildClass(list, c);
        }
        return list;

    }
}
