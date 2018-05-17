import util.dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by warkey on 2018-04-24.
 * 测试类
 */
public class dbtest {
    public static void main(String[] args) throws SQLException {
        Connection conn= dbutil.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql="select * from phone where name = ?";
        try
        {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,"华为");
          rs=pstmt.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        //通过ResultSet获取数据
        while(rs.next())
        {
            String id=rs.getString("id");
            String name=rs.getString("name");
            String price=rs.getString("price");
            String brief=rs.getString("brief");
            Phone phone=new Phone();
            phone.setId(Integer.parseInt(id));
            phone.setName(name);
            phone.setPrice(Double.parseDouble(price));
            phone.setBrief(brief);
            System.out.println("查询到");
            System.out.println(phone);



        }


    }
}
