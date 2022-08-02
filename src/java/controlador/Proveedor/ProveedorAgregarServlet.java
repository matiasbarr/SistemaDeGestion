/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.Proveedor;

import entidades.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.ProveedorFacadeLocal;

/**
 *
 * @author Farru
 */
public class ProveedorAgregarServlet extends HttpServlet {

    @EJB
    private ProveedorFacadeLocal proveedorFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            String rolproveedor = request.getParameter("txt_rol_proveedor");
            String razonSocial = request.getParameter("txt_razon_social");
            String direccionProveedor = request.getParameter("txt_direccion_proveedor");
            String correoProveedor = request.getParameter("txt_correo_proveedor");
            int telefonoProveedor = Integer.parseInt(request.getParameter("txt_telefono_proveedor"));
            String descripcionProveedor = request.getParameter("txt_descripcion_proveedor");
            String giro = request.getParameter("txt_giro");
            Date fechaRegistro = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd  hh:mm:ss E a ");
            
            Proveedor proveedor = new Proveedor();
            
            proveedor.setRolProveedor(rolproveedor);
            proveedor.setRazonSocial(razonSocial);
            proveedor.setDireccionProveedor(direccionProveedor);
            proveedor.setCorreoProveedor(correoProveedor);
            proveedor.setTelefonoProveedor(telefonoProveedor);
            proveedor.setDescripcionProveedor(descripcionProveedor);
            proveedor.setGiro(giro);
            proveedor.setFechaRegistro(fechaRegistro);
            
           
            //insertar objeto en base de datos
            proveedorFacade.create(proveedor);
                        
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
