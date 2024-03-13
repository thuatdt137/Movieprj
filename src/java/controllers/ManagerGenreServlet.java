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
import java.util.ArrayList;
import models.*;

/**
 *
 * @author thuat
 */
public class ManagerGenreServlet extends HttpServlet {

    int numPerPage = 5;
    DAO dao = DAO.getINSTANCE();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String indexPage = request.getParameter("index");
        
        int index = 1;
        if (indexPage != null) {
            index = Integer.parseInt(indexPage);
        }

        int count1 = dao.getTotalGenre();
        int endPage1 = count1 / numPerPage;
        if (count1 % numPerPage != 0) {
            endPage1++;
        }

        ArrayList<Genre> list_genre = dao.pagingGenre(index, numPerPage);

        request.setAttribute("listA", list_genre);

        request.setAttribute("num1", count1);
        request.setAttribute("currPage", index);
        request.setAttribute("endPage1", endPage1);

        request.getRequestDispatcher("views/managerGenre.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
