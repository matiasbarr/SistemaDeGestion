
package controlador.venta;

import entidades.Carrito;
import entidades.Cliente;
import entidades.Empleado;
import entidades.Producto;
import entidades.TipoDocumento;
import entidades.TipoEstado;
import entidades.TipoOrigenVenta;
import entidades.TipoPago;
import entidades.Venta;
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
import sessionBean.CarritoFacadeLocal;
import sessionBean.ClienteFacadeLocal;
import sessionBean.EmpleadoFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.TipoDocumentoFacadeLocal;
import sessionBean.TipoEstadoFacadeLocal;
import sessionBean.TipoOrigenVentaFacadeLocal;
import sessionBean.TipoPagoFacadeLocal;
import sessionBean.VentaFacadeLocal;


public class VentaCarritoAgregarServlet extends HttpServlet {

    @EJB
    private ProductoFacadeLocal productoFacade;

    @EJB
    private TipoPagoFacadeLocal tipoPagoFacade;

    @EJB
    private TipoDocumentoFacadeLocal tipoDocumentoFacade;

    @EJB
    private VentaFacadeLocal ventaFacade;

    @EJB
    private TipoOrigenVentaFacadeLocal tipoOrigenVentaFacade;

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;

    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private CarritoFacadeLocal carritoFacade;

    @EJB
    private TipoEstadoFacadeLocal tipoEstadoFacade;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
          String rutcliente = request.getParameter("txt_rut_cliente");
            int idcli = Integer.parseInt(request.getParameter("cbx_cliente"));
            int idtipodoc = Integer.parseInt(request.getParameter("cbx_tipo_documento"));
            int idemp = Integer.parseInt(request.getParameter("hdn_id_empleado"));
            Date fechaVenta = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd  hh:mm:ss a");
            ft.format(fechaVenta);
            
            TipoEstado tipes = tipoEstadoFacade.find(3);
            Cliente cli = clienteFacade.find(idcli);
            Empleado emp = empleadoFacade.find(idemp);
            TipoOrigenVenta tiporgven = tipoOrigenVentaFacade.find(1);
            
            
            Venta vent = new Venta();
            vent.setRutCliente(rutcliente);
            vent.setIdTipoOrigenVenta(tiporgven);
            vent.setIdEmpleado(emp);
            vent.setIdTipoEstado(tipes);
            vent.setIdCliente(cli);
            vent.setFechaVenta(fechaVenta);
            
            ventaFacade.create(vent);
            List<Venta> Despuesventa = ventaFacade.findAll();
            int indice = Despuesventa.size();
            Venta ultimaVenta = Despuesventa.get(indice-1);
             
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
                
                Carrito car = new Carrito();
                car.setIdProducto(prod);  
                car.setIdVenta(ultimaVenta);                            
                car.setCantidad(Double.parseDouble(var2));
                car.setMontoNeto(totalProducto);
                
                
                carritoFacade.create(car);
             
            }
                List<Carrito> listaCarritos = carritoFacade.findAll();
                TipoDocumento tipodoc = tipoDocumentoFacade.find(idtipodoc);
                List<TipoPago> listaTipoPagos = tipoPagoFacade.findAll();
                
                request.setAttribute("listaCarritos",listaCarritos);
                request.setAttribute("listaTipoPagos",listaTipoPagos);
                request.setAttribute("tipodoc",tipodoc);
                request.setAttribute("ultimaVenta",ultimaVenta);
                request.setAttribute("emp",emp); 
                RequestDispatcher rd = request.getRequestDispatcher("generar-documento-venta.jsp");
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
