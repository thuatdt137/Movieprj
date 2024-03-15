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
public class ManagerActorServlet extends HttpServlet {

    int numPerPage = 5;
    DAO dao = DAO.getINSTANCE();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String urlImgPath = getServletContext().getInitParameter("Urlactors");

        String indexPage = request.getParameter("index");

        int index = 1;
        if (indexPage != null) {
            index = Integer.parseInt(indexPage);
        }

        int count = dao.getTotalActor();
        int endPage = count / numPerPage;
        if (count % numPerPage != 0) {
            endPage++;
        }

        ArrayList<Actor> list_actor = dao.pagingActors(index, numPerPage);

        request.setAttribute("listA", list_actor);

        request.setAttribute("num", count);
        request.setAttribute("currPage", index);
        request.setAttribute("endPage", endPage);
        request.setAttribute("urlImg", urlImgPath);

        request.getRequestDispatcher("views/managerActor.jsp").forward(request, response);

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
