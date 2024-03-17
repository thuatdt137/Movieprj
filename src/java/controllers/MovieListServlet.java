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
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import models.*;

/**
 *
 * @author thuat
 */
public class MovieListServlet extends HttpServlet {

    int numPerPage = 5;
    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String urlImgPath = getServletContext().getInitParameter("UrlImage");
        String urlImgPath2 = getServletContext().getInitParameter("Urlactors");
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();

        String search_title = request.getParameter("title") == null ? "" : request.getParameter("title");
        String genre_list = request.getParameter("genre_movie") == null ? "" : request.getParameter("genre_movie");
        if (!search_title.isBlank()) {

            ArrayList<Movie> movies = dao.searchMovies(search_title, dao.getStringGenre(), 0, year);
            request.setAttribute("movies", movies);
        } else if (!genre_list.isBlank()) {
            ArrayList<Movie> movies = dao.getMoviesbyGenre(genre_list);
            request.setAttribute("movies", movies);
        } else {
            ArrayList<Movie> movies = dao.getMovies();
            request.setAttribute("movies", movies);
        }
        request.setAttribute("urlImg", urlImgPath);
        request.setAttribute("urlImg2", urlImgPath2);

        ArrayList<Genre> genres = dao.getGenres();
        request.setAttribute("genres", genres);
        request.getRequestDispatcher("views/movieList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieName = request.getParameter("title");
        String[] genres = request.getParameterValues("genress") == null ? dao.getStringGenre() : request.getParameterValues("genress");
        int startYear = Integer.parseInt(request.getParameter("startYear"));
        int endYear = Integer.parseInt(request.getParameter("endYear"));

        String urlImgPath = getServletContext().getInitParameter("UrlImage");
        String urlImgPath2 = getServletContext().getInitParameter("Urlactors");

        request.setAttribute("urlImg", urlImgPath);
        request.setAttribute("urlImg2", urlImgPath2);

        ArrayList<Movie> movies = dao.searchMovies(movieName, genres, startYear, endYear);
        ArrayList<Genre> genress = dao.getGenres();

        request.setAttribute("movies", movies);
        request.setAttribute("genres", genress);
        if (movies == null) {
            request.setAttribute("msg", "NOT FOUND");
        }
        request.setAttribute("hehee", Arrays.toString(genres));

        request.getRequestDispatcher("views/movieList.jsp").forward(request, response);
    }

}
