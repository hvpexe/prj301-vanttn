/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dto.User;
import utils.DBUtils;

/**
 *
 * @author PhuHV
 */
public class UserDAO {

    public static User getAccount(String userid, String password) throws Exception {
        User user = null;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT userID, fullName, roleID, password\n"
                        + "FROM tblUsers\n"
                        + "WHERE userID = ? and password = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, userid);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullName");
                    String roleid = rs.getString("roleID");
                    user = new User(userid, fullname, roleid, password);
                }
            }
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
