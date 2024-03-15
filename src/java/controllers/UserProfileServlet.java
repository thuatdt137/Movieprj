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
import java.util.ArrayList;
import models.*;

/**
 *
 * @author thuat
 */
public class UserProfileServlet extends HttpServlet {

    int numPerPage = 2;
    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Object user_string = session.getAttribute("id");
        //String user_string = request.getParameter("user") == null ? "" : request.getParameter("user");
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        String indexPage = request.getParameter("index") == null ? null : request.getParameter("index");
        String urlImgPath = getServletContext().getInitParameter("UrlImage");
        String urlImgPath2 = getServletContext().getInitParameter("Urlactors");
        int index = 1;
        if (indexPage != null) {
            index = Integer.parseInt(indexPage);
        }

        int count = dao.getTotalMovieUser();
        int endPage = count / numPerPage;
        if (count % numPerPage != 0) {
            endPage++;
        }

        if (user_string == null) {
            request.getRequestDispatcher("views/homepage.jsp").forward(request, response);
        }
        int id = -1;
        try {
            id = (Integer) user_string;

        } catch (NumberFormatException e) {
        }
        User user = dao.getUserbyId(id);

        request.setAttribute("user", user);
        request.setAttribute("urlImg", urlImgPath);
        request.setAttribute("urlImg2", urlImgPath2);

        if (null == action) {
            request.getRequestDispatcher("views/userprofile.jsp").forward(request, response);
        } else {
            switch (action) {
                case "favoritemovie" -> {
                    ArrayList<Movie> movies = dao.getFavoriteMoviesByUser(id, index, numPerPage);
                    request.setAttribute("movies", movies);
                    request.setAttribute("num", count);
                    request.setAttribute("currPage", index);
                    request.setAttribute("endPage", endPage);
                    request.getRequestDispatcher("views/userfavoritemovie.jsp").forward(request, response);
                }
                case "profile" ->
                    request.getRequestDispatcher("views/userprofile.jsp").forward(request, response);
                default ->
                    request.getRequestDispatcher("views/userprofile.jsp").forward(request, response);
            }
        }
        request.getRequestDispatcher("views/userprofile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;

        String id_string = request.getParameter("id");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("newpassword");
        String email = request.getParameter("email");
        try {
            id = Integer.parseInt(id_string);

            dao.updateUser(name, username, password, email, id);
            doGet(request, response);
        } catch (NumberFormatException e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
