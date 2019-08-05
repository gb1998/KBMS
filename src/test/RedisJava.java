import org.junit.Test;
import redis.clients.jedis.Jedis;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created by warkey on 2018-03-22.
 */
public class RedisJava {
    @Test
    public void testConnection()
    {
        Jedis jedis=new Jedis("localhost");
        System.out.println("连接成功");
        System.out.println("服务器正在连接"+jedis.ping());
        jedis.set("key","这是第一个值");
        System.out.println("存储的字符串为  "+jedis.get("key"));
        //数据存在列表中
        jedis.lpush("mylist","Taobao");
        jedis.lpush("mylist","Google");
        jedis.lpush("mylist","Baidu");
        //获取数据以及输出
        List<String> list=jedis.lrange("mylist",0,2);
        for (int i=0;i<list.size();i++)
        {
            System.out.println("列表项为"+list.get(i));
        }
        //获取所有的example
        Set<String> keys=jedis.keys("*");
        Iterator<String> it=keys.iterator();
        while(it.hasNext())
        {
            String key=it.next();
            System.out.println(key);
        }
    }
}
