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
public class UpdateActorServlet extends HttpServlet {

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

        String id_string = request.getParameter("aid");
        out.println(id_string);
        int id;
        try {
            id = Integer.parseInt(id_string);
            Actor actor = dao.getActorbyId(id);
            request.setAttribute("actorSelected", actor);
            request.getRequestDispatcher("views/updateactor.jsp").forward(request, response);
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

        int id = 0, status = 0;
        String urlImgPath = getServletContext().getInitParameter("Urlactors");

        String id_string = request.getParameter("id");
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String descript = request.getParameter("description");
        String status_string = request.getParameter("status");
        Part filePart = request.getPart("image");
        try {
            id = Integer.parseInt(id_string);
            status = Integer.parseInt(status_string);

        } catch (NumberFormatException e) {
        }
        if (filePart != null && filePart.getSize() > 0) {
            out.print("hehe");
            String realPath = request.getServletContext().getRealPath(urlImgPath);

            String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Path.of(realPath))) {
                Files.createDirectory(Path.of(realPath));
            }

            filePart.write(realPath + "\\" + fileName);

            dao.updateActor(id, name, fileName, date, descript, status);
        } else {
            dao.updateActor(id, name, date, descript, status);
        }

        response.sendRedirect("manageactor");
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
