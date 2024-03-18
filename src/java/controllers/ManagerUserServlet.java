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
public class ManagerUserServlet extends HttpServlet {

    int numPerPage = 5;
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
        String indexPage = request.getParameter("index");
        int index = 1;
        if (indexPage != null) {
            index = Integer.parseInt(indexPage);
        }

        int count = dao.getTotalUser();
        int endPage = count / numPerPage;
        if (count % numPerPage != 0) {
            endPage++;
        }

        ArrayList<User> list_user = dao.pagingAccount(index, numPerPage);
        ArrayList<Movie> list_movie = dao.pagingMovies(index, numPerPage, "1");
        request.setAttribute("listA", list_user);
        request.setAttribute("listB", list_movie);
        request.setAttribute("numUser", count);
        request.setAttribute("currPage", index);
        request.setAttribute("endPage", endPage);
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
        response.setContentType("text/html;charset=UTF-8");
        String indexPage = request.getParameter("index");
        
        int index = 1;
        if (indexPage != null) {
            index = Integer.parseInt(indexPage);
        }

        int count1 = dao.getTotalUser();
        int endPage1 = count1 / numPerPage;
        if (count1 % numPerPage != 0) {
            endPage1++;
        }

        ArrayList<User> list_user = dao.pagingAccount(index, numPerPage);

        request.setAttribute("listA", list_user);

        request.setAttribute("num1", count1);
        request.setAttribute("currPage", index);
        request.setAttribute("endPage1", endPage1);

        request.getRequestDispatcher("views/managerUser.jsp").forward(request, response);

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
        doGet(request, response);
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
