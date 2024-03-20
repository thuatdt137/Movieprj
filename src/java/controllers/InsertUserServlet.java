/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author thuat
 */
public class InsertUserServlet extends HttpServlet {

    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int role, status;

        String name = request.getParameter("nameinsert");
        String username = request.getParameter("usernameinsert");
        String password = request.getParameter("passwordinsert");
        String email = request.getParameter("emailinsert");
        String role_string = request.getParameter("roleinsert");
        String status_string = request.getParameter("statusinsert");
        try {
            role = Integer.parseInt(role_string);
            status = Integer.parseInt(status_string);

            dao.insertUser(name, username, password, email, role, status);
            response.sendRedirect("manageuser");
        } catch (NumberFormatException e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
