/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import utils.DBUtils;

/**
 *
 * @author PhuHV
 */
public class CarDAO {

    public static boolean createCar(String id, String name, String description, float price, int speed, boolean status) {
        boolean result = false;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO tblCars(id, name, description, price, speed, status)\n"
                        + "VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, name);
                ps.setString(3, description);
                ps.setFloat(4, price);
                ps.setInt(5, speed);
                ps.setBoolean(6, status);
                if (ps.executeUpdate() == 1) {
                    result = true;
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
