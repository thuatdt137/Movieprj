/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import models.Actor;
import models.Genre;
import models.Movie;

/**
 *
 * @author thuat
 */
public class ChangeLoveServlet extends HttpServlet {

    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String mid_string = request.getParameter("mid") == null ? "" : request.getParameter("mid");
        if (mid_string == null) {
            request.getRequestDispatcher("views/homepage.jsp").forward(request, response);
        }
        int mid = -1;
        try {
            mid = Integer.parseInt(mid_string);
        } catch (NumberFormatException e) {
        }
        Movie movie = dao.getMovieByID(mid);
        if (movie == null || movie.getStatus() == 0) {
            request.getRequestDispatcher("404").forward(request, response);
        }

        if (session != null) {
            Object uid_string = session.getAttribute("id");
            int uid;
            if (uid_string != null) {
                try {
                    uid = (Integer) uid_string;
                    dao.changeLove(uid, mid);

                } catch (NumberFormatException e) {
                }
            } else {
                request.getRequestDispatcher("404").forward(request, response);
            }
        }

        request.getRequestDispatcher("moviedetail?movie=" + mid).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
