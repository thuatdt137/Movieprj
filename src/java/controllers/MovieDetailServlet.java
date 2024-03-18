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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MovieDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MovieDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        if (movie == null) {
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
