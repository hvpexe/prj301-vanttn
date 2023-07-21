/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import sample.dto.Account;
import sample.dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.utils.Utils;

/**
 *
 * @author PhuHV
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String save = request.getParameter("savelogin");
            Account acc = null;
            try {
                //kiem tra xem email hay password co de trong khong
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    Cookie[] c = request.getCookies();
                    String token = "";
                    if (c != null) {
                        for (Cookie cookie : c) {
                            if (cookie.getName().equals("selector")) {
                                token = cookie.getValue();
                            }
                        }
                    }
                    if (!token.equals("")) {
                        response.sendRedirect("personal");
                    } else {
                        response.sendRedirect("errorpage.jsp");
                    }

                } else {
                    acc = AccountDAO.getAccount(email, password);
                    if (acc != null) {
                        if (acc.getStatus() == 1) {
                            //admin
                            if (acc.getRole() == 1) {
                                //chuyen qua admin home page
                                HttpSession session = request.getSession(true);
                                if (session != null) {
                                    session.setAttribute("name", acc.getFullname());
                                    session.setAttribute("email", email);
                                    session.setAttribute("login", acc);
                                    //create a cookie and attach it to response object
                                    if (save != null) {
                                        String token = Utils.getRandomToken(); //this is a sample to study
                                        AccountDAO.updateToken(token, email);
                                        Cookie cookie = new Cookie("selector", token);
                                        cookie.setMaxAge(60 * 2); //this is a sample
                                        response.addCookie(cookie);
                                    }
                                    response.sendRedirect("AdminIndex.jsp");
                                }
                            } //user  
                            else {
                                //chuyen qua welcome page
//                        response.sendRedirect("welcome.html");
                                HttpSession session = request.getSession(true);
                                if (session != null) {
                                    session.setAttribute("name", acc.getFullname());
                                    session.setAttribute("email", email);
                                    session.setAttribute("login", acc);
                                    //create a cookie and attach it to response object
                                    if (save != null) {
                                        String token = Utils.getRandomToken();//this is sample to study. You should replace this code to get random
                                        AccountDAO.updateToken(token, email);
                                        Cookie cookie = new Cookie("selector", token);
                                        cookie.setMaxAge(60 * 2);
                                        response.addCookie(cookie);
                                    }
                                    response.sendRedirect("personal");
                                }
                            }
                        } else {
                            request.setAttribute("WARNING", "You have been banned");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }

                    } else {
                        response.sendRedirect("errorpage.html");
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
