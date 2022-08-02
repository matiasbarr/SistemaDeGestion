/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.Producto;

import entidades.Categoria;
import entidades.Producto;
import entidades.SubCategoria;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.CategoriaFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.SubCategoriaFacadeLocal;

/**
 *
 * @author john-
 */
public class ProductoModificarServlet extends HttpServlet {

    @EJB
    private ProductoFacadeLocal productoFacade;

    @EJB
    private SubCategoriaFacadeLocal subCategoriaFacade;

    @EJB
    private CategoriaFacadeLocal categoriaFacade;

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
        
            int idproducto = Integer.parseInt(request.getParameter("hdn_id_producto"));
            int idcategoria = Integer.parseInt(request.getParameter("cbx_categoria"));
            int idsubcategoria = Integer.parseInt(request.getParameter("cbx_subcategoria"));
            String nombreproducto = request.getParameter("txt_producto");
            double peso      = Double.parseDouble(request.getParameter("txt_peso"));
            double valor     = Double.parseDouble(request.getParameter("txt_valor"));
            String formato = request.getParameter("txt_formato");
            Producto prod = productoFacade.find(idproducto);
            Categoria cat = categoriaFacade.find(idcategoria);
            SubCategoria subcat = subCategoriaFacade.find(idsubcategoria);
            
            prod.setIdCategoria(cat);
            prod.setIdSubCategoria(subcat);
            prod.setFormato(formato);
            prod.setNombreProducto(nombreproducto);
            prod.setPeso(peso);
            prod.setValor(valor);
            productoFacade.edit(prod);
            
            RequestDispatcher rd = request.getRequestDispatcher("listar");
            rd.forward(request, response);
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
