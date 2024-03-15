/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import models.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
/**
 *
 * @author thuat
 */
public class UpdateMovieServlet extends HttpServlet {

    //String urlImgPath = getServletContext().getInitParameter("Urlactors");
    DAO dao = DAO.getINSTANCE();

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
        PrintWriter out = response.getWriter();

        String id_string = request.getParameter("mid");
        out.println(id_string);
        int id;
        try {
            id = Integer.parseInt(id_string);
            Movie movie = dao.getMovieByID(id);
            request.setAttribute("movieSelected", movie);
            request.getRequestDispatcher("views/updatemovie.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
        }
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
        PrintWriter out = response.getWriter();

        int id = 0, status = 0, statusRelease = 0;

        String id_string = request.getParameter("id");
        String title = request.getParameter("title");
        String date = request.getParameter("date");
        String descript = request.getParameter("description");
        String source = request.getParameter("source");
        String trailer = request.getParameter("trailer");
        String status_string = request.getParameter("status");
        String statusRelease_string = request.getParameter("statusrelease");
        String[] genres = request.getParameterValues("genres");
        String[] actors = request.getParameterValues("actors");
        Part filePart = request.getPart("image");
        try {
            id = Integer.parseInt(id_string);
            status = Integer.parseInt(status_string);
            statusRelease = Integer.parseInt(statusRelease_string);

        } catch (NumberFormatException e) {
        }
        if (filePart != null && filePart.getSize() > 0) {
            out.print("hehe");
            String urlImgPath = "images/uploads/movies";
            String realPath = request.getServletContext().getRealPath(urlImgPath);

            String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }

            filePart.write(realPath + "\\" + fileName);

            dao.updateMovie(id, title, date, descript, fileName, source, trailer, status, statusRelease);
        } else {
            dao.updateMoviewithoutImg(id, title, date, descript, source, trailer, status, statusRelease);
        }

        response.sendRedirect("managemovie");
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
