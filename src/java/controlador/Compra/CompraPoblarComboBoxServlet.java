
package controlador.Compra;

import entidades.Empleado;
import entidades.Producto;
import entidades.Proveedor;
import entidades.TipoDocumento;
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
import sessionBean.EmpleadoFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.ProveedorFacadeLocal;
import sessionBean.TipoDocumentoFacadeLocal;
import sessionBean.TipoPagoFacadeLocal;


public class CompraPoblarComboBoxServlet extends HttpServlet {

    @EJB
    private TipoPagoFacadeLocal tipoPagoFacade;

    @EJB
    private TipoDocumentoFacadeLocal tipoDocumentoFacade;


    @EJB
    private ProveedorFacadeLocal proveedorFacade;

    @EJB
    private ProductoFacadeLocal productoFacade;

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;
    
    

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            
            Empleado emp = empleadoFacade.find(6);
            List<Producto> productos = productoFacade.findAll();
            List<Proveedor> proveedores = proveedorFacade.findAll();
            List<TipoDocumento> tipodocumentos = tipoDocumentoFacade.findAll();
            List<TipoPago> tipopagos =  tipoPagoFacade.findAll();
            
               
            request.setAttribute("emp", emp);
            request.setAttribute("productos", productos);
            request.setAttribute("proveedores", proveedores);
            request.setAttribute("tipodocumentos", tipodocumentos);
            request.setAttribute("tipopagos", tipopagos);
            
            RequestDispatcher rd = request.getRequestDispatcher("realizar-compra.jsp");
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
