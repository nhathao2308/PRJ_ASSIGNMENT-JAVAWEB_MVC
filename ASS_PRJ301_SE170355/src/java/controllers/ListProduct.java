/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Product.ProductDAO;
import Product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nhath
 */
@WebServlet(name = "ListProduct", urlPatterns = {"/ListProduct"})
public class ListProduct extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> list = dao.getListProduct(search);
            if (list.size() > 0) {
                request.setAttribute("listProduct", list);
                url = SUCCESS;
                request.setAttribute(
                        "endP", 1);
                request.setAttribute("indexPage", 1);
            } else {
                String indexPage = request.getParameter("index");
                if (indexPage
                        == null) {
                    indexPage = "1";
                }
                int index = Integer.parseInt(indexPage);
                int count = dao.getTotalProduct();
                int endPage = count / 3;
                if (count
                        % 3 != 0) {
                    endPage++;
                }
                list = dao.pagingProduct(index);
                request.setAttribute("listProduct", list);
                url = SUCCESS;
                request.setAttribute(
                        "endP", endPage);
                request.setAttribute("indexPage", index);
            }

        } catch (Exception e) {
            log("Error at ListProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
