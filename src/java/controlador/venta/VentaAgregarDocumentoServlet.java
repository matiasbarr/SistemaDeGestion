
package controlador.venta;

import entidades.Carrito;
import entidades.DocumentoTransaccionVenta;
import entidades.Producto;
import entidades.TipoDocumento;
import entidades.TipoEstado;
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
import sessionBean.DocumentoTransaccionVentaFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.TipoDocumentoFacadeLocal;
import sessionBean.TipoEstadoFacadeLocal;
import sessionBean.TipoPagoFacadeLocal;
import sessionBean.VentaFacadeLocal;

/**
 *
 * @author Barriga
 */
public class VentaAgregarDocumentoServlet extends HttpServlet {

    @EJB
    private DocumentoTransaccionVentaFacadeLocal documentoTransaccionVentaFacade;

    @EJB
    private VentaFacadeLocal ventaFacade;

    @EJB
    private TipoPagoFacadeLocal tipoPagoFacade;

    @EJB
    private TipoDocumentoFacadeLocal tipoDocumentoFacade;

    @EJB
    private TipoEstadoFacadeLocal tipoEstadoFacade;

    @EJB
    private ProductoFacadeLocal productoFacade;

    @EJB
    private CarritoFacadeLocal carritoFacade;

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int numerodocumento = Integer.parseInt(request.getParameter("txt_numero_documento"));
            int idventa = Integer.parseInt(request.getParameter("hdn_id_venta"));
            int idtipodocumento = Integer.parseInt(request.getParameter("hdn_id_tipo_documento"));
            int tipopago = Integer.parseInt(request.getParameter("cbx_tipopago"));
            
            Venta vent = ventaFacade.find(idventa);  
            TipoDocumento tipdoc = tipoDocumentoFacade.find(idtipodocumento);
            TipoPago tipopag = tipoPagoFacade.find(tipopago);
            
            List<Carrito> carritos = carritoFacade.findAll();
            int idventaactual = vent.getIdVenta();         
            double montoneto=0;
            double montoimpuesto=1.19;
            for (int i = 0; i < carritos.size(); i++) {
                Carrito carr = carritos.get(i); 
                
                           
                Venta ventF = carr.getIdVenta();                
               // out.println(det.getIdVenta());
                int idvendet = ventF.getIdVenta();
                
                if (idvendet == idventaactual ) {
                    montoneto=montoneto+carr.getMontoNeto();
                }
            }
            double montototal = montoneto * montoimpuesto;
           
            
            DocumentoTransaccionVenta doctransvent = new DocumentoTransaccionVenta();           
            Date fecha_transaccion = new Date( );
            SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd  hh:mm:ss a");
            ft.format(fecha_transaccion);
           
            doctransvent.setNumeroDocumento(numerodocumento);
            doctransvent.setIdTipoDocumento(tipdoc);
            doctransvent.setIdTipoPago(tipopag);
            doctransvent.setIdVenta(vent);
            doctransvent.setMontoNeto(montoneto);
            doctransvent.setMontoImpuesto(montoimpuesto);
            doctransvent.setMontoTotal(montototal);
            doctransvent.setFechaTransaccion(fecha_transaccion);

            documentoTransaccionVentaFacade.create(doctransvent);

            TipoEstado tipoestado = tipoEstadoFacade.find(5);
            vent.setIdTipoEstado(tipoestado);
            ventaFacade.edit(vent);

            for (int i = 0; i < carritos.size(); i++) {
                Carrito car = carritos.get(i);
                Venta ventF = car.getIdVenta();
                int idvendet = ventF.getIdVenta();
                if (idvendet == idventaactual) {
                    Producto prodF = car.getIdProducto();
                    int stock = prodF.getStock();
                    double cantidad = car.getCantidad();
                    int nuevostock = (int) (Math.round(cantidad) - stock);
                    prodF.setStock(nuevostock);
                    productoFacade.edit(prodF);
                    out.println("id Prod:" + prodF.getIdProducto() + "Stock:" + prodF.getStock());
                }
            }
            List<Carrito> carritosVentaActual = carritoFacade.findAll();
            for (int i = 0; i < carritosVentaActual.size(); i++) {
                Carrito c = carritosVentaActual.get(i);
                Venta ventaCarrito = c.getIdVenta();
                int idventaCarrito = ventaCarrito.getIdVenta();
                if (idventaCarrito != idventaactual) {                  
                    carritosVentaActual.remove(i);
                    i--; 
                }
                         
            }
            request.setAttribute("carritosVentaActual", carritosVentaActual);
            request.setAttribute("doctransvent",doctransvent);
            request.setAttribute("vent", vent);
            RequestDispatcher rd = request.getRequestDispatcher("documento-generado.jsp");
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
