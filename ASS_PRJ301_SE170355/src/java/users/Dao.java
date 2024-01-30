/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

public class Dao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getTotalAccount() {
        String query = "select count(*) from dbo.tblUsers";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public List<UserDTO> pagingAccount(int index) {
        List<UserDTO> list = new ArrayList<>();
        String query = "select * from dbo.tblUsers\n"
                + "order by userID\n"
                + "offset ? rows fetch next 3 rows only;";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO o = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(4), rs.getString(3));
                list.add(o);
                 System.out.println(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        Dao dao = new Dao();
        List<UserDTO> list = dao.pagingAccount(1);
        for (UserDTO o : list) {
            System.out.println(o.getUserID());
            System.out.println(o.getFullName());
            System.out.println(o.getRoleID());
            System.out.println(o.getPassword());
        }
        System.out.println(list);
    }
}
