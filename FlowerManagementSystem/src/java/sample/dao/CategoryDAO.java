/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import sample.dto.Category;
import sample.utils.DBUtils;

/**
 *
 * @author PhuHV
 */
public class CategoryDAO {

    public static ArrayList<Category> getCategories() throws Exception {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT CateID, CateName\n"
                        + "FROM Categories";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int cateID = table.getInt("CateID");
                        String cateName = table.getString("CateName");
                        Category cate = new Category(cateID, cateName);
                        list.add(cate);
                    } //het while
                }//het if
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
