/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author PhuHV
 */
public class DBUtils {

    public static Connection makeConnection() {
        Connection cn = null;
        try {
            String IP = "localhost";
            String instanceName = "DESKTOP-AHJPC9G";
            String port = "1433";
            String uid = "sa";
            String pwd = "12345";
            String db = "CarManagement";
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                    + ";databasename=" + db + ";user=" + uid + ";password=" + pwd;
            Class.forName(driver);
            cn = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }

    public static void main(String[] args) {
        try {
            System.out.println(makeConnection());
        } catch (Exception e) {

        }
    }
}
