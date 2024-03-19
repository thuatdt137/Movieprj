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
import models.*;

/**
 *
 * @author thuat
 */
public class MovieDetailServlet extends HttpServlet {

    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String movie_string = request.getParameter("movie") == null ? "" : request.getParameter("movie");
        String urlImgPath = getServletContext().getInitParameter("UrlImage");
        String urlImgPath2 = getServletContext().getInitParameter("Urlactors");
        if (movie_string == null) {
            request.getRequestDispatcher("views/homepage.jsp").forward(request, response);
        }
        int id = -1;
        try {
            id = Integer.parseInt(movie_string);
        } catch (NumberFormatException e) {
        }
        Movie movie = dao.getMovieByID(id);
        if (movie == null || movie.getStatus() == 0) {
            request.getRequestDispatcher("404").forward(request, response);
        }
        ArrayList<Actor> actors = dao.getActorsbyMovie(id);
        ArrayList<Genre> genres = dao.getGenresbyMovie(id);

        if (session != null) {
            Object user_string = session.getAttribute("id");
            int idd;
            if (user_string != null) {
                try {
                    idd = (Integer) user_string;
                    for (Movie movieLove : dao.getFavoriteMoviesByUser(idd, 1, 100)) {
                        if (movieLove.getId() == movie.getId()) {
                            request.setAttribute("islove", 1);
                            break;
                        }
                    }

                } catch (NumberFormatException e) {
                }
            } else {
                request.setAttribute("islove", 0);
            }
        }

        request.setAttribute("moviee", movie);
        request.setAttribute("actors", actors);
        request.setAttribute("genres", genres);
        request.setAttribute("urlImg", urlImgPath);
        request.setAttribute("urlImg2", urlImgPath2);

        request.getRequestDispatcher("views/moviedetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
