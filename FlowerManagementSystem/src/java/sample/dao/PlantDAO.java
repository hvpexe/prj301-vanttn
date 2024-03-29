/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sample.dto.Plant;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author PhuHV
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "SELECT PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                        + "FROM Plants JOIN Categories on Plants.CateID = Categories.CateID";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql += " WHERE Plants.PName like ?";
                } else {
                    sql += " WHERE CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateId");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Plant getPlant(int pid) {
        Plant plant = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                        + "FROM Plants JOIN Categories on Plants.CateID = Categories.CateID\n"
                        + "WHERE Plants.PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateId");
                    String catename = rs.getString("CateName");
                    plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
              cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return plant;
    }

    public static void main(String[] args) {
        System.out.println(getPlant(2));
    }
}
