import org.apache.log4j.Logger;
import org.junit.Test;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

/**
 * 测试日记能否输出
 */
public class testLog {
    private final static Logger log= Logger.getLogger(testLog.class);


   @Test
   public void testRandom()
   {
       Random random=new Random();
       Set<Integer> randomid=new HashSet<>();
       for (int i=0;i<10000;i++)
       {
           Integer j=random.nextInt(4)+1+(1 << 16);

           randomid.add(j);//利用hashset去重
           if(randomid.size()==3)
           {
               log.info(":1213");
              for(Integer x:randomid)
              {
                  x=x-(1 << 16);
                 log.info("随机生成的数id"+x);
              }

            break;
           }


       }

   }

    public static void main(String[] args){
        Logger log= Logger.getLogger("testLog.class");
        log.info("___--info");



        //log.trace("123");
        //log.error("123")


    }
}
