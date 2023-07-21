/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author PhuHV
 */
public class DBUtils {

    public static Connection makeConnection() throws Exception {
        Connection cn = null;
        String IP = "localhost";
        String instanceName = "DESKTOP-AHJPC9G";
        String port = "1433";
        String uid = "sa";
        String pwd = "12345";
        String db = "PlantShop";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
        Class.forName(driver);
        cn = DriverManager.getConnection(url);
        return cn;
    }
//        public static Connection makeConnection() throws Exception {
//        Connection cn = null;
//        String IP = "167.172.92.134";
//        String instanceName = "";
//        String port = "1433";
//        String uid = "sa";
//        String pwd = "Huynhvanphu102Exe";
//        String db = "PlantShop";
//        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
//                + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
//        Class.forName(driver);
//        cn = DriverManager.getConnection(url);
//        return cn;
//    }
    public static void main(String[] args) {
        try {
        System.out.println(makeConnection());
        } catch (Exception e) {
           
        }
    }
}
