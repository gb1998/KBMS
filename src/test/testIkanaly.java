/**
 * Created by warkey on 2018-03-24.
 * 查看分词效果
 */


import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.junit.Test;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.io.StringReader;

public class testIkanaly {
    @Test
    public void testIKanalysiser() throws IOException {

        Analyzer analyzer = new IKAnalyzer();
        TokenStream ts = analyzer.tokenStream("field",
                new StringReader("popo孩子"));
        OffsetAttribute offsetAtt = ts.addAttribute(OffsetAttribute.class);
        try {
            ts.reset();
            while (ts.incrementToken()) {
                System.out.println(offsetAtt.toString());
            }
            ts.end();
        } finally {
            ts.close();
        }
    }
}
