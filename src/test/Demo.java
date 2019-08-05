import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.analysis.tokenattributes.TypeAttribute;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.io.StringReader;
import java.util.*;

/**
 * Created by warkey on 2018-04-18.
 */
public class Demo {
    public static void main(String[] args) {

        List<String> keyWords = new ArrayList<>();
        int k = 2;  //窗口大小/2
        float d = 0.85f;
        /**
         * 标点符号、常用词、以及“名词、动词、形容词、副词之外的词”
         */
        Set<String> stopWordSet = new HashSet<String>();
        stopWordSet.add("是");
        stopWordSet.add("的");
        stopWordSet.add("地");
        stopWordSet.add("从");
        stopWordSet.add("将");
        stopWordSet.add("但");
        stopWordSet.add("都");
        stopWordSet.add("和");
        stopWordSet.add("为");
        stopWordSet.add("让");
        stopWordSet.add("在");
        stopWordSet.add("由");
        stopWordSet.add("上");
        String field = "根据一份报道，电子设备巨头三星考虑使用区块链平台管理其全球供应链。\n" +
                "\n" +
                "彭博社报道，据称三星电子（Samsung Electronics）已经准备好搭建一个分布式账本系统，追踪国际海运，预计此举可能将海运成本砍掉20%。\n" +
                "\n" +
                "该集团的物流和IT子公司Samsung SDS据称在开发这个平台。\n" +
                "\n" +
                "SDS副主席兼区块链主管Song Kwang-woo说，“它将对制造业供应链产生巨大影响。区块链是助力我们数字化转型的核心平台”。\n" +
                "\n" +
                "根据报道，2018年SDS将运输大约50万吨航空货物和大约一百万个海运集装箱，货物价值数百亿美元。\n" +
                "\n" +
                "转向基于区块链的系统预期可以让公司减少高额成本，比如高成本的运输单据，让它更快地对市场动态做出反应。\n" +
                "\n" +
                "三星并不是唯一将在供应链行业采用区块链技术的大型公司。去年IBM、NTT Data和Air France等大公司都一直在从事独立的系统，给他们的网络带来更多效率和透明性。\n" +
                "\n" +
                "仅仅上个月，中国石化巨头中化集团就成功地利用区块链追踪到新加坡的一批海运出口的石油。（区块链铅笔）";


        Analyzer analyzer = new IKAnalyzer(true);
        TokenStream ts = null;
        //分词
        try {
            ts = analyzer.tokenStream("myfield", new StringReader(field));
            OffsetAttribute offset = (OffsetAttribute) ts.addAttribute(OffsetAttribute.class);
            CharTermAttribute term = (CharTermAttribute) ts.addAttribute(CharTermAttribute.class);
            TypeAttribute type = (TypeAttribute) ts.addAttribute(TypeAttribute.class);
            ts.reset();

            while (ts.incrementToken()) {
                if (!stopWordSet.contains(term.toString())) {
                    keyWords.add(term.toString());
                }
            }
            ts.end();
        } catch (IOException var14) {
            var14.printStackTrace();
        } finally {
            if (ts != null) {
                try {
                    ts.close();
                } catch (IOException var13) {
                    var13.printStackTrace();
                }
            }

        }

        Map<String, Set<String>> relationWords = new HashMap<>();


        //获取每个关键词 前后k个的组合
        for (int i = 0; i < keyWords.size(); i++) {
            String keyword = keyWords.get(i);
            Set<String> keySets = relationWords.get(keyword);
            if (keySets == null) {
                keySets = new HashSet<>();
                relationWords.put(keyword, keySets);
            }

            for (int j = i - k; j <= i + k; j++) {
                if (j < 0 || j >= keyWords.size() || j == i) {
                    continue;
                } else {
                    keySets.add(keyWords.get(j));
                }
            }
        }

       /* for (String s : relationWords.keySet()) {
            System.out.print(s+" ");
            for (String s1 : relationWords.get(s)) {
                System.out.print(s1+" ");
            }
            System.out.println();
        }*/


        Map<String, Float> score = new HashMap<>();
        float min_diff = 0.1f; //差值最小
        int max_iter = 100;//最大迭代次数

        //迭代
        for (int i = 0; i < max_iter; i++) {
            Map<String, Float> m = new HashMap<>();
            float max_diff = 0;
            for (String key : relationWords.keySet()) {
                Set<String> value = relationWords.get(key);
                //先给每个关键词一个默认rank值
                m.put(key, 1 - d);
                //一个关键词的TextRank由其它成员投票出来
                for (String other : value) {
                    int size = relationWords.get(other).size();
                    if (key.equals(other) || size == 0) {
                        continue;
                    } else {
                        m.put(key, m.get(key) + d / size * (score.get(other) == null ? 0 : score.get(other)));
                    }
                }
//                System.out.println("m.get(key):"+m.get(key)+" score:"+(score.get(key) == null ? 0 : score.get(key)));
                max_diff = Math.max(max_diff, Math.abs(m.get(key) - (score.get(key) == null ? 0 : score.get(key))));
            }

            score = m;
            if (max_diff <= min_diff) {
                System.out.println("迭代次数：" + i);
                break;
            }
        }

        List<Score> scores = new ArrayList<>();
        for (String s : score.keySet()) {
            Score score1 = new Score();
            score1.key = s;
            score1.significance = score.get(s);
            scores.add(score1);
        }

        scores.sort(new Comparator<Score>() {
            @Override
            public int compare(Score o1, Score o2) {
                if (o2.significance - o1.significance > 0) {
                    return 1;
                } else {
                    return -1;
                }

            }
        });

        for (Score score1 : scores) {
            System.out.println(score1);
        }

    }
}

class Score {
    String key;
    float significance;

    @Override
    public String toString() {
        return "关键词=" + key +
                ", 重要程度=" + significance;
    }
}