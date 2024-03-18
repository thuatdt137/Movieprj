/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import models.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author thuat
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/login.jsp").forward(request, response);

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

        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DAO dao = DAO.getINSTANCE();
        HttpSession session = request.getSession();

        User user = dao.getUserbyUsernamePassword(username, password);
        if (user != null && user.getStatus() == 1) {
            session.setAttribute("us", user.getUsername());
            session.setAttribute("ps", user.getPassword());
            session.setAttribute("role", user.getRole());
            session.setAttribute("id", user.getId());
        } else if (user == null) {
            request.setAttribute("msg", "Invalid username or password");
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "You don't have permission to log in now, try again later");
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }

        String returnUrl = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("returnUrl")) {
                    returnUrl = cookie.getValue();
                    break;
                }
            }
        }

        if (returnUrl != null) {
            response.sendRedirect(returnUrl);
        } else {
            // Nếu không có returnUrl, chuyển hướng đến một trang mặc định
            response.sendRedirect("homepage");
        }
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
