/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LamVo
 */
public class DBConnection implements Serializable {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con = null;
        //1. load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2. make connection string
        String con_url = "jdbc:sqlserver://167.172.92.134:1433;database=TemplateForAll;encrypt=true;trustServerCertificate=true;CharacterSet=UTF-8";
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
            System.out.println(getConnection());
        } catch (ClassNotFoundException ex)
        {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex)
        {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
