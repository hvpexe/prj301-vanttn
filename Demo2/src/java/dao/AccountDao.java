/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import basic.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author PhuHV
 */
public class AccountDao {

    //hàm này để lấy all account trong bảng accounts của DB
    public static ArrayList<Account> getAccounts() throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n"
                        + "FROM dbo.Accounts";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        int accid = table.getInt("accID");
                        String email = table.getString("email");
                        String password = table.getString("password");
                        String fullname = table.getString("fullname");
                        String phone = table.getString("phone");
                        int status = table.getInt("status");
                        int role = table.getInt("role");
                        Account acc = new Account(accid, email, password, fullname, phone, status, role);
                        list.add(acc);
                    } //het while
                }//het if
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //hàm này để lấy ds all accounts dựa vào role
    public static ArrayList<Account> getAccounts(int role) throws Exception {
        ArrayList<Account> list = new ArrayList<>();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n"
                        + "FROM dbo.Accounts\n"
                        + "WHERE role = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, role);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int accid = table.getInt("accID");
                        String email = table.getString("email");
                        String password = table.getString("password");
                        String fullname = table.getString("fullname");
                        String phone = table.getString("phone");
                        int status = table.getInt("status");
                        Account acc = new Account(accid, email, password, fullname, phone, status, role);
                        list.add(acc);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //hàm này để trả về 1 account đưa vào email, password
    //và status = 1 (active)
    public static Account getAccount(String email, String password) throws Exception {
        Account acc = null;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT [accID],[email],[password],[fullname],[phone],[status],[role]\n"
                        + "FROM dbo.Accounts\n"
                        + "WHERE email = ? AND status = 1 AND password = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int accid = rs.getInt("accID");
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    acc = new Account(accid, email, password, fullname, phone, status, role);
                }
            }
            cn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return acc;
    }

    //hàm này để chèn 1 new account vào bảng accounts 
    public static int insertAccount(String email, String password, String fullname, String phone, int status, int role) throws Exception {
        int result = 0;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Accounts (email, password, fullname, phone, status, role)\n"
                        + "VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setString(3, fullname);
                ps.setString(4, phone);
                ps.setInt(5, status);
                ps.setInt(6, role);
                if (ps.executeUpdate() == 1) {
                    result = 1;
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    //hàm này để sửa profile của 1 account khi biết accid
    public static int updateAccount(int accID, String email, String password, String fullname, String phone, int status, int role) throws Exception {
        int result = 0;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Accounts\n"
                        + "SET email = ?, password= ?, fullname = ?, phone = ?, status = ?, role = ?\n"
                        + "WHERE accID = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setString(3, fullname);
                ps.setString(4, phone);
                ps.setInt(5, status);
                ps.setInt(6, role);
                ps.setInt(7, accID);
                if (ps.executeUpdate() == 1) {
                    result = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
