package com.kbms_module.test;
import com.kbms_module.pojo.Doc;
import com.kbms_module.pojo.PageBean;
import com.kbms_module.service.LuceneService;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.util.List;

/**
 * Created by warkey on 2018-03-24.
 * 测试建立索引
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring/*")
public class luncetest {
    //注入lucene 服务
    @Autowired
    private LuceneService luceneService;
    //新增加索引
    @Test
    public  void  addindex() {
        try {
            luceneService.addindex();
            System.out.println("成功");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @Test
    public void find ()
    {
        try {

            PageBean pageSearchList = luceneService.getPageSearchList(1, 20, "年度电影原声", 0);
            List<Doc> docList = pageSearchList.getDocList();
            for (Doc c:docList)
            {
                System.out.println(c.getTitle());
            }

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (InvalidTokenOffsetsException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
