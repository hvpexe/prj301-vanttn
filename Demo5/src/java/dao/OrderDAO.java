/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import mylib.DBUtils;

/**
 *
 * @author PhuHV
 */
public class OrderDAO {

    //ham nay de chen vao new order
    //chen 1 record vao bang order truoc
    //sau do moi chen gio hang vao order detial
    public static int insertOrder(int accid, HashMap<String, Integer> cart) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            cn.setAutoCommit(false); //tat che do auto commit, sau khi chay sql no chi nam tren bang tam inserted, deleted
            String sql = "insert dbo.Orders(OrdDate,shipdate,status,AccID)\n"
                    + "values(?,NULL,1,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            Date d = new Date(System.currentTimeMillis());
            pst.setDate(1, d);
            pst.setInt(2, accid);
            result = pst.executeUpdate();
            if (result > 0) {
                sql = "SELECT TOP 1 OrderID FROM Orders order by OrderID DESC";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int orderid = rs.getInt("OrderID");
                    for (String id : cart.keySet()) {
                        sql = "insert dbo.OrderDetails([OrderID],[FID],[quantity])\n"
                                + "values(?,?,?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, orderid);
                        pst.setInt(2, Integer.parseInt(id.trim()));
                        pst.setInt(3, cart.get(id));
                        result = pst.executeUpdate();
                    }
                    cn.commit();
                    cn.setAutoCommit(true);

                }
            }
        }
        return result;
    }
}
