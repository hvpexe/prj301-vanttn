/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import basic.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PhuHV
 */
public class Servlet2 extends HttpServlet {

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
            //đọc data nhận đc từ servlet1
            HttpSession s = request.getSession();
            Account acc = (Account) s.getAttribute("LoginUser");
            if (acc != null) {
                out.print("<h1> Welcome: " + acc.getFullname() + "</h1>");
            } else {
                response.sendRedirect("index.html");
            }
            ArrayList<Account> list = (ArrayList<Account>) request.getAttribute("result");
            if (list != null && list.size() > 0) {
                out.print("<table>");
                out.print("<tr>");
                out.print("<th>ID</th>");
                out.print("<th>Fullname</th>");
                out.print("<th>Status</th></tr>");
                for (Account account : list) {
                    out.print("<tr>");
                    out.print("<td>" + account.getAccid() + "</td>");
                    out.print("<td>" + account.getFullname() + "</td>");
                    out.print("<td>" + account.getStatus() + "</td>");
                    out.print("<td>" + account.getRole() + "</td>");
                    if (account.getRole() == 0) {
                        out.print("<td><a href='#'>Block</a>     <a href='#'>UnBlock</a></td>");
                    }
                    out.print("</tr>");
                }
                out.print("</table>");
            } else {
                response.sendRedirect("Servlet1");
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
