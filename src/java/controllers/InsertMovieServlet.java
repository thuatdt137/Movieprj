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
import java.util.Arrays;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
/**
 *
 * @author thuat
 */
public class InsertMovieServlet extends HttpServlet {

    //String urlImgPath = getServletContext().getInitParameter("UrlImage");

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
        request.setAttribute("movie", dao.getMovies());
        request.getRequestDispatcher("managemovie").forward(request, response);
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
        PrintWriter out = response.getWriter();

        String[] genres = request.getParameterValues("genres");
        String[] actors = request.getParameterValues("actors");
        out.println(Arrays.toString(genres));

        String name = request.getParameter("nameinsert");
        String date = request.getParameter("dateinsert");
        String description = request.getParameter("descriptioninsert");
        String source = request.getParameter("sourceinsert");
        String trailer = request.getParameter("trailerinsert");
        String status_string = request.getParameter("statusinsert");

        Part filePart = request.getPart("imginsert");

        String realPath = request.getServletContext().getRealPath("images/uploads/movies");

        String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

        if (!Files.exists(Path.of(realPath))) {
            Files.createDirectory(Path.of(realPath));
        }

        filePart.write(realPath + "\\" + fileName);

        try {
            status = Integer.parseInt(status_string);

            dao.insertMovie(name, date, description, fileName, source, trailer, status, 1, genres, actors);
            response.sendRedirect("managemovie");
        } catch (NumberFormatException e) {
        }
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
