/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import sample.dto.Order;
import sample.dto.OrderDetail;
import sample.dto.Plant;
import sample.utils.DBUtils;

/**
 *
 * @author PhuHV
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> orders = new ArrayList<Order>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, Orders.status, Orders.AccID\n"
                        + "FROM Orders\n"
                        + "JOIN Accounts\n"
                        + "ON Orders.AccID = Accounts.accID\n"
                        + "WHERE Accounts.email = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipDate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accId = rs.getInt("AccID");
                    Order order = new Order(orderID, orderDate, shipDate, status, accId);
                    orders.add(order);
                }
            }
            cn.close();

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
        return orders;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        Connection cn = null;
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT DetailId, OrderID, PID, PName, price, imgPath, quantity\n"
                        + "FROM OrderDetails, Plants\n"
                        + "WHERE OrderID = ? AND OrderDetails.FID = Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailID = rs.getInt("DetailId");
                        int plantID = rs.getInt("PID");
                        String plantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderDetail = new OrderDetail(detailID, orderID, plantID, plantName, price, imgPath, quantity);
                        list.add(orderDetail);
                    }
                }
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

    public static ArrayList<Order> getOrdersByStatus(String email, int status) {
        ArrayList<Order> orders = new ArrayList<Order>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, Orders.AccID\n"
                        + "FROM Orders\n"
                        + "JOIN Accounts\n"
                        + "ON Orders.AccID = Accounts.accID\n"
                        + "WHERE Accounts.email = ? AND Orders.status = ?";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setInt(2, status);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipDate = rs.getString("shipdate");
                    int accId = rs.getInt("AccID");
                    Order order = new Order(orderID, orderDate, shipDate, status, accId);
                    orders.add(order);
                }
            }
            cn.close();

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
        return orders;
    }

    public static ArrayList<Order> getOrdersByFilterDate(String email, Date from, Date to) {
        ArrayList<Order> orders = new ArrayList<Order>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, Orders.AccID, Orders.status\n"
                        + "FROM Orders\n"
                        + "JOIN Accounts ON Orders.AccID = Accounts.accID\n"
                        + "WHERE Accounts.email = ? AND (OrdDate BETWEEN ? AND ?)";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, email);
                ps.setDate(2, from);
                ps.setDate(3, to);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipDate = rs.getString("shipdate");
                    int accId = rs.getInt("AccID");
                    int status = rs.getInt("status");
                    Order order = new Order(orderID, orderDate, shipDate, status, accId);
                    orders.add(order);
                }
            }
            cn.close();

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
        return orders;
    }

    public static boolean insertOrder(String email, HashMap<Plant, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false); //off autocommit
                //get account id by email
                String sql = "select accID from accounts where accounts.email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                //insert a new order
                System.out.println("accountid:" + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date:" + d);
                sql = "INSERT Orders(OrdDate, status, AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id taht is the largest number
                sql = "SELECT TOP 1 OrderID FROM ORDERS\n"
                        + "ORDER BY OrderID DESC";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                }
                //insert order details
                System.out.println("orderid:" + orderid);
                Set<Plant> plants = cart.keySet();
                for (Plant plant : plants) {
                    String pid = Integer.toString(plant.getId());
                    sql = "INSERT OrderDetails values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(plant));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("k chen order dc");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static boolean updateOrderStatus(int orderID, int status) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                String sql = "UPDATE Orders \n"
                        + "SET status = ?\n"
                        + "WHERE OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);
                if (pst.executeUpdate() > 0) {
                    return true;
                }
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
        return result;
    }
    
    public static ArrayList<Order> getAllOrders() {
        ArrayList<Order> orders = new ArrayList<Order>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT OrderID, OrdDate, shipdate, Orders.status, Orders.AccID\n"
                        + "FROM Orders\n"
                        + "JOIN Accounts\n"
                        + "ON Orders.AccID = Accounts.accID\n";
                PreparedStatement ps = cn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipDate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accId = rs.getInt("AccID");
                    Order order = new Order(orderID, orderDate, shipDate, status, accId);
                    orders.add(order);
                }
            }
            cn.close();

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
        return orders;
    }
}
