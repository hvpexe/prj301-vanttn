/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mylib;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PhuHV
 */
public class DBUtils implements Serializable{

//    public static Connection makeConnection() throws Exception {
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
    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        Connection con = null;
        //1. load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. make connection string
        String con_url = "jdbc:sqlserver://167.172.92.134:1433;database=PlantShop;encrypt=true;trustServerCertificate=true;CharacterSet=UTF-8";
        //3. open connection
        con = DriverManager.getConnection(con_url, "sa", "Huynhvanphu102Exe");
        //4. return conenction
        if (con != null) {
            System.out.println("=========connection ok=======");
        }
        return con;
    }
    public static void main(String[] args) {
        try
        {
            System.out.println(makeConnection());
        } catch (ClassNotFoundException ex)
        {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex)
        {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
