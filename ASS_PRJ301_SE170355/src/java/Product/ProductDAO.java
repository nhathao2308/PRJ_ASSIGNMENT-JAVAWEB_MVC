/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import users.UserDTO;
import utils.DBUtil;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static final String SEARCH = "SELECT productID, name, price, image FROM tblProducts WHERE name like ?";
    private static final String DELETE = "DELETE tblProducts WHERE productID=?";
//    private static final String UPDATE = "UPDATE tblUsers set fullName=?, roleID=? WHERE userID=?";
    private static final String UPDATE = "UPDATE tblProducts set name=?, price=? WHERE productID=?";
//        private static final String INSERT = "INSERT INTO tblUsers(userID, fullName, roleID, password) VALUES(?,?,?,?)";
    private static final String INSERT = "INSERT INTO tblProducts(productID, name, price, quantity ,image) VALUES(?,?,?,?,?)";


    
    public int getTotalProduct() {
        String query = "select count(*) from dbo.tblProducts";
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

    public List<ProductDTO> pagingProduct(int index) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from dbo.tblProducts\n"
                + "order by productID\n"
                + "offset ? rows fetch next 3 rows only;";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 3);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO o = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5));
                list.add(o);
//                 System.out.println(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ProductDTO o = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                    list.add(o);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<ProductDTO> getListProduct() {
        List<ProductDTO> list = new ArrayList<>();
        String query = "select * from dbo.tblProducts\n"
                + "order by productID";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO o = new ProductDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5));
                list.add(o);
//                 System.out.println(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }



    public boolean update(ProductDTO product) throws SQLException {
          boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, product.getProductName());
                ptm.setString(2, product.getPrice());
                ptm.setString(3, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean insert(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtil.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getProductName());
                ptm.setString(3, product.getPrice());
                ptm.setString(4, "");
                ptm.setString(5, product.getImage());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
        public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();
        ProductDTO d = new ProductDTO("83", "12", "9", "1");
        try {
            boolean check = dao.insert(d);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        List<ProductDTO> list = dao.getListProduct();
        for (ProductDTO productDao : list) {
            System.out.println(productDao.getProductID());
            System.out.println(productDao.getProductName());
            System.out.println(productDao.getPrice());
            System.out.println(productDao.getImage());
        }
    }
}
