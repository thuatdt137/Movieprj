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
import models.*;

/**
 *
 * @author thuat
 */
public class UpdateGenreServlet extends HttpServlet {

    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_string = request.getParameter("gid");
        int id;
        try {
            id = Integer.parseInt(id_string);
            Genre genre = dao.getGenrebyId(id);
            request.setAttribute("genreSelected", genre);
            request.getRequestDispatcher("views/updategenre.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;

        String id_string = request.getParameter("id");
        String name = request.getParameter("name");
        try {
            id = Integer.parseInt(id_string);

            dao.updateGenre(id, name);
            response.sendRedirect("managegenre");
        } catch (NumberFormatException e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
