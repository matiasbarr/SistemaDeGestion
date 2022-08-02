/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.Compra;

import entidades.Compra;
import entidades.Detalle;
import entidades.Empleado;
import entidades.Producto;
import entidades.Proveedor;
import entidades.TipoDocumento;
import entidades.TipoEstado;
import entidades.TipoPago;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.CompraFacadeLocal;
import sessionBean.DetalleFacadeLocal;
import sessionBean.EmpleadoFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.ProveedorFacadeLocal;
import sessionBean.TipoDocumentoFacadeLocal;
import sessionBean.TipoEstadoFacadeLocal;
import sessionBean.TipoPagoFacadeLocal;

/**
 *
 * @author john-
 */
public class CompraCarritoAgregarServlet extends HttpServlet {

    @EJB
    private TipoPagoFacadeLocal tipoPagoFacade;

    @EJB
    private TipoDocumentoFacadeLocal tipoDocumentoFacade;

    @EJB
    private DetalleFacadeLocal detalleFacade;

    @EJB
    private CompraFacadeLocal compraFacade;

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;

    @EJB
    private ProveedorFacadeLocal proveedorFacade;

    @EJB
    private TipoEstadoFacadeLocal tipoEstadoFacade;
    

    @EJB
    private ProductoFacadeLocal productoFacade;
    

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {        
     
            String rolproveedor = request.getParameter("txt_rol_proveedor");

            int idprov = Integer.parseInt(request.getParameter("cbx_proveedor"));
            int idemp = Integer.parseInt(request.getParameter("hdn_id_empleado"));
            Date fechaCompra = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd  hh:mm:ss a");
            ft.format(fechaCompra);

            TipoEstado tipes = tipoEstadoFacade.find(3);
            Proveedor prov = proveedorFacade.find(idprov);
            Empleado emp = empleadoFacade.find(idemp);

            String rutemp = emp.getRutEmpleado() + "-" + emp.getDvEmpleado();

            Compra comp = new Compra();
            comp.setRolProveedor(rolproveedor);
            comp.setRutEncargado(rutemp);
            comp.setIdProveedor(prov);
            comp.setIdEmpleado(emp);
            comp.setIdTipoEstado(tipes);
            comp.setFechaCompra(fechaCompra);
            
            
   
 
            compraFacade.create(comp);
            List<Compra> Despuescompra =compraFacade.findAll();
            int indice = Despuescompra.size();
            Compra ultimaCompra = Despuescompra.get(indice-1);            
            
 

            String detalleString = request.getParameter("hdn_detalle");

            String[] separadoVertical = detalleString.split("-");
            String var1 = "";
            String var2 = "";
            for (int i = 0; i < separadoVertical.length; i++) {
                String sepver = separadoVertical[i];
                String[] sep2 = sepver.split(";");
                var1 = sep2[0];
                var2 = sep2[1];

                Producto prod = productoFacade.find(Integer.parseInt(var1));
                double totalProducto = prod.getValor() * Integer.parseInt(var2);

                Detalle det = new Detalle();
                det.setIdProducto(prod);
                det.setIdCompra(ultimaCompra);
                det.setCantidad(Double.parseDouble(var2));
                det.setMontoNeto(totalProducto);
                detalleFacade.create(det);
            }
                TipoDocumento tipodoc = tipoDocumentoFacade.find(1);
                List<TipoPago> listaTipoPagos = tipoPagoFacade.findAll();
                List<Detalle> listaDetalles = detalleFacade.findAll();
               
                request.setAttribute("prov", prov);
                request.setAttribute("listaDetalles", listaDetalles);
                request.setAttribute("listaTipoPagos",listaTipoPagos);
                request.setAttribute("tipodoc",tipodoc);
                request.setAttribute("ultimaCompra",ultimaCompra);
                request.setAttribute("emp",emp);
                RequestDispatcher rd = request.getRequestDispatcher("generar-documento.jsp");
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
