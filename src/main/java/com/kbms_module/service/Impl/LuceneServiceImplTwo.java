package com.kbms_module.service.Impl;

import com.kbms_module.dao.DocDao;
import com.kbms_module.dao.DocTagMapper;
import com.kbms_module.dao.UserDao;
import com.kbms_module.mapper.LuceneDao;
import com.kbms_module.mapper.LuceneDaoImpl;
import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.PageBean;
import com.kbms_module.pojo.User;
import com.kbms_module.service.LuceneService;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by warkey on 2018-03-19.
 */
@Service
public class LuceneServiceImplTwo implements LuceneService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private DocTagMapper docTagMapper;
    @Autowired
    private DocDao docDao;
    List<Doc> docList=null;
    //搜索分页需要有数据源
    private LuceneDao luceneDao=new LuceneDaoImpl();
    @Override
    public PageBean getPageSearchList(Integer currentpage, Integer searchListSize, String keyword, Integer sort) throws ParseException, InvalidTokenOffsetsException, IOException {
     PageBean pageBean= luceneDao.findIndex(keyword,currentpage,searchListSize,sort);
     List<Doc> docList=pageBean.getDocList();
     //加载用户信息和标签
        for (Doc d:docList)
        {
            User authoruser = userDao.selectUserbyId(d.getAuthorId());
            d.setUser(authoruser);
            //加载一边文档的所有的标签
            try {
                Doc tagdoc = docTagMapper.getDocByidWithTags(d.getId());
                d.setTagsList(tagdoc.getTagsList());
            }catch (Exception e)
            {
                System.out.println("标签集合为空");
            }

        }
        return pageBean;
    }

    @Override
    public void addindex() {
         System.out.println("开始建立索引");
         docList=docDao.getDocs() ;
         for (Doc d:docList)
         {
            luceneDao.addIndex(toDocument(d));
         }

         System.out.println("创建索引完成");
    }

    @Override
    public void addOneindex(Doc d) {
        System.out.println("开始建立索引");
        luceneDao.addIndex(toDocument(d));
    }
    //将文档转变为document对象
    private Document toDocument(Doc d) {
        Document document=new Document();
        try {
            SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String date=format.format(d.getCreatetime());
            document.add(new StringField("Id",String.valueOf(d.getId()), Field.Store.YES));
            document.add(new TextField("title",d.getTitle(), Field.Store.YES));
            document.add(new StringField("ctime",date,Field.Store.YES));

            document.add(new TextField("content",d.getContent(),Field.Store.YES));//进行语义化
            document.add(new StringField("hot",String.valueOf(d.getHostnums()),Field.Store.YES));
            //这里只对摘要进行处理，以后将没有自动截取内容的前多少文字为摘要
            document.add(new TextField("smmary",d.getSummary(), Field.Store.YES));
            document.add(new StringField("authorId",String.valueOf(d.getAuthorId()), Field.Store.YES));
        }catch (Exception e)
        {
             e.printStackTrace();
            System.out.println("空指针");
        }
        return document;
    }

    @Override
    public void updateindex(Doc d) {
        //更新索引
        try {
            luceneDao.updateIndex(toDocument(d));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteindex() {

    }
}
