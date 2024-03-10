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
import java.io.File;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
/**
 *
 * @author thuat
 */
public class InsertMovieServlet extends HttpServlet {

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
        int status;

        String name = request.getParameter("nameinsert");
        String date = request.getParameter("dateinsert");
        String description = request.getParameter("descriptioninsert");
        Part filePart = request.getPart("imginsert");
        String source = request.getParameter("sourceinsert");
        String trailer = request.getParameter("trailerinsert");
        String status_string = request.getParameter("statusinsert");

        String fileName = filePart.getSubmittedFileName();
        isDirExist("/images/uploads/movies/");
        String filePath = "/images/uploads/movies/" + fileName;
        try {
            status = Integer.parseInt(status_string);

            dao.insertMovie(name, date, description, filePath, source, trailer, status, 1);
            response.sendRedirect("managemovie");
        } catch (NumberFormatException e) {
        }
    }

    public static boolean isDirExist(String directoryPath) {
        File directory = new File(directoryPath);

        // Kiểm tra xem thư mục đã tồn tại chưa
        if (!directory.exists()) {
            // Nếu không tồn tại, thì tạo mới
            return directory.mkdirs();
        }

        // Nếu thư mục đã tồn tại, không cần tạo mới
        return true;
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
