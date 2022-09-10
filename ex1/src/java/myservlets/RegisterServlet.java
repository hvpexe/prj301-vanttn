/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myservlets;

import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhuHV
 */
public class RegisterServlet extends HttpServlet {

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
            //validation : check email trung
            ArrayList<Account> list = new ArrayList<>();
            list.add(new Account("thi no", "a@gmail.com", "123", "female", "student"));
            list.add(new Account("chi pheo", "b@gmail.com", "123", "male", "student"));
            list.add(new Account("thuy kieu", "c@gmail.com", "123", "female", "student"));
            list.add(new Account("thuy van", "d@gmail.com", "123", "female", "student"));
            
            //Lay data tu resgister.html truyen vao
            String fullname = request.getParameter("fuilname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String job = request.getParameter("job");
            
            //xu li
            boolean flag = false;
            for (Account account : list) {
                if (account.getEmail().equals(email)) {
                    flag = true;
                    break;
                }
            }
            if (flag == true) { //do trung email
                    response.sendRedirect("error.html");
            } else {
                out.println("<h2> Your account </h2>");
                out.println("<p>Fullname:" + fullname + "</p>");
                out.println("<p>Gender:" + gender + "</p>");
                out.println("<p>Job:" + job + "</p>");
                out.println("<h3>Please check your email: " + email + " to active your account</p>");
                

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
