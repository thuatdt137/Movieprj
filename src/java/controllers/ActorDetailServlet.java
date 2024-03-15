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
import java.util.ArrayList;
import models.*;

/**
 *
 * @author thuat
 */
public class ActorDetailServlet extends HttpServlet {

    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actor_string = request.getParameter("actor") == null ? "" : request.getParameter("actor");
        String urlImgPath = getServletContext().getInitParameter("UrlImage");
        String urlImgPath2 = getServletContext().getInitParameter("Urlactors");
        if (actor_string == null) {
            request.getRequestDispatcher("views/homepage.jsp").forward(request, response);
        }
        int id = -1;
        try {
            id = Integer.parseInt(actor_string);
        } catch (NumberFormatException e) {
        }
        Actor actor = dao.getActorbyId(id);
        ArrayList<Movie> movies = dao.getMoviesByActor(id);

        request.setAttribute("actor", actor);
        request.setAttribute("movies", movies);
        request.setAttribute("urlImg", urlImgPath);
        request.setAttribute("urlImg2", urlImgPath2);

        request.getRequestDispatcher("views/actordetail.jsp").forward(request, response);
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
