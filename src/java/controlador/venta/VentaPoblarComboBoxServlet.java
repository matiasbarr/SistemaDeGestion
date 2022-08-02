/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.venta;

import entidades.Cliente;
import entidades.Empleado;
import entidades.Producto;
import entidades.TipoDocumento;
import entidades.TipoOrigenVenta;
import entidades.TipoPago;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.ClienteFacadeLocal;
import sessionBean.EmpleadoFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.TipoDocumentoFacadeLocal;
import sessionBean.TipoOrigenVentaFacadeLocal;
import sessionBean.TipoPagoFacadeLocal;

/**
 *
 * @author Barriga
 */
public class VentaPoblarComboBoxServlet extends HttpServlet {

    @EJB
    private TipoOrigenVentaFacadeLocal tipoOrigenVentaFacade;

    @EJB
    private TipoDocumentoFacadeLocal tipoDocumentoFacade;

    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private TipoPagoFacadeLocal tipoPagoFacade;

    @EJB
    private ProductoFacadeLocal productoFacade;

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;

    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Empleado emp = empleadoFacade.find(6);            
            List<Cliente> listaclientes = clienteFacade.findAll();
            List<Producto> productos = productoFacade.findAll();
            List<TipoDocumento> tipodocumentos = tipoDocumentoFacade.findAll();
            List<TipoPago> tipopagos =  tipoPagoFacade.findAll();
            List<TipoOrigenVenta> tipoorvent = tipoOrigenVentaFacade.findAll();
                           
            request.setAttribute("emp", emp);
            request.setAttribute("listaclientes", listaclientes);
            request.setAttribute("productos", productos);            
            request.setAttribute("tipodocumentos", tipodocumentos);
            request.setAttribute("tipopagos", tipopagos);
            request.setAttribute("tipoorvent", tipoorvent);
            
            RequestDispatcher rd = request.getRequestDispatcher("realizar-venta.jsp");
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
