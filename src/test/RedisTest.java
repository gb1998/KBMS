import com.kbms_module.service.Impl.JedisClientSingle;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

/**
 * Created by warkey on 2018-03-22.
 */
public class RedisTest {
    @Test
    public void testRedisPool()
    {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-redis.xml");

        JedisPool pool = (JedisPool) applicationContext.getBean("jedisPool");
        Jedis jedis = pool.getResource();
        jedis.set("lanlan", "piaopiao");
        String string = jedis.get("lanlan");
        System.out.println(string);
        System.out.println("redis jedis 连接成功");


    }
    @Test
    public void testJedis()
    {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-redis.xml");
        JedisClientSingle jedisClientSingle= (JedisClientSingle) applicationContext.getBean("jedisClient");
        jedisClientSingle.set("lanlan12345", "piaopiao1");
        String string = jedisClientSingle.get("lanlan12345");
        System.out.println(string);
        System.out.println("redis jedis 连接成功");


    }
}
