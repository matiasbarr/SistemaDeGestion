/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador.Compra;

import entidades.Compra;
import entidades.Detalle;
import entidades.Producto;
import entidades.TipoDocumento;
import entidades.TipoDocumentoTransaccion;
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
import sessionBean.ProductoFacadeLocal;
import sessionBean.TipoDocumentoFacadeLocal;
import sessionBean.TipoDocumentoTransaccionFacadeLocal;
import sessionBean.TipoEstadoFacadeLocal;
import sessionBean.TipoPagoFacadeLocal;

public class CompraAgregarDocumentoServlet extends HttpServlet {

    @EJB
    private TipoDocumentoTransaccionFacadeLocal tipoDocumentoTransaccionFacade;

    @EJB
    private ProductoFacadeLocal productoFacade;

    @EJB
    private TipoEstadoFacadeLocal tipoEstadoFacade;

    @EJB
    private DetalleFacadeLocal detalleFacade;

    @EJB
    private TipoDocumentoFacadeLocal tipoDocumentoFacade;

    @EJB
    private TipoPagoFacadeLocal tipoPagoFacade;

    @EJB
    private CompraFacadeLocal compraFacade;
    
    
    

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //se crean variables locales que reciben los datos del formulario
            int numerodocumento = Integer.parseInt(request.getParameter("txt_numero_documento"));
            int idcompra = Integer.parseInt(request.getParameter("hdn_id_compra"));
            int idtipodocumento = Integer.parseInt(request.getParameter("hdn_id_tipo_documento"));
            int tipopago = Integer.parseInt(request.getParameter("cbx_tipopago"));
            //se crean y poblan objetos buscados por su id por medio del query alojado en los facade
            Compra comp = compraFacade.find(idcompra);
            TipoDocumento tipdoc = tipoDocumentoFacade.find(idtipodocumento);
            TipoPago tipopag = tipoPagoFacade.find(tipopago);
            //se recupera el id de la compra actual
            int idcompraActual = comp.getIdCompra();
            //se recuperan todos los detalles de la base de datos
            List<Detalle> detalles = detalleFacade.findAll();
            //se definen las variables montoneto que sera un acomulador y el montoimpuesto equivalente al IVA
            double montoneto=0;
            double montoimpuesto=1.19;
            //se recorre la lista con todos los detalles
            for (int i = 0; i < detalles.size(); i++) {
               //se crea un detalle dimaico por cada item de la iteracion
                Detalle det = detalles.get(i);                      
                //se crea una compra dinamica en base la llave foranea de detalle, lo que retorna un objeto de tipo Compra
                Compra compF = det.getIdCompra();
                //se almacena el id de la compra obtenida de la llave foranea
                int idcomdet = compF.getIdCompra();
                //se compara el id de la compra actual con el de la compra de la llave foranea, para asegurar que
                //esa compra es la misma en el detalle 
                if (idcomdet == idcompraActual ) {
                    //se aumenta el acomulador del monto neto que suma todos los totales de los productos
                    montoneto=montoneto+det.getMontoNeto();
                }
            }
            out.println(montoneto);
            //se calcula el monto total, multiplicando el monto neto por el monto del impuesto
           double montototal = montoneto * montoimpuesto;
           //se crea un y se pobla el objeto TipoDocumentoTransaccion con la informacion correspondiente al documento legal
           TipoDocumentoTransaccion tipodoctrans = new TipoDocumentoTransaccion();
           //se crea la fecha de la transaccion y se le asigna el formato requerido
           Date fecha_transaccion = new Date( );
           SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd  hh:mm:ss a");
           ft.format(fecha_transaccion);
           tipodoctrans.setNumeroDocumento(numerodocumento);
           tipodoctrans.setIdTipoDocumento(tipdoc);
           tipodoctrans.setIdTipoPago(tipopag);
           tipodoctrans.setIdCompra(comp);
           tipodoctrans.setMontoNeto(montoneto);
           tipodoctrans.setMontoImpuesto(montoimpuesto);
           tipodoctrans.setMontoTotal(montototal);
           tipodoctrans.setFechaTransaccion(fecha_transaccion);
           //se inserta el objeto en la base de datos
           tipoDocumentoTransaccionFacade.create(tipodoctrans);
           //se crea un objeto de tipo estado de id 5 "Pagada"
           TipoEstado tipoestado = tipoEstadoFacade.find(5);
           //se acualiza el estado de la compra
           comp.setIdTipoEstado(tipoestado);
           //se inserta la compra actualizada en la base de dato
           compraFacade.edit(comp);
           //se recorre la lista de los detalles
            for (int i = 0; i < detalles.size(); i++) {
                //se crea un detalle dimaico por cada item de la iteracion
                Detalle det = detalles.get(i);              
                //se crea una compra dinamica en base la llave foranea de detalle, lo que retorna un objeto de tipo Compra               
                Compra compF = det.getIdCompra();
                //se almacena el id de la compra obtenida de la llave foranea
                int idcomdet = compF.getIdCompra();
                //se compara el id de la compra actual con el de la compra de la llave foranea, para asegurar que
                //esa compra es la misma en el detalle 
                if (idcomdet == idcompraActual ) {
                  //se crea un producto dinamico en base a la llave foranea de detalle
                  Producto prodF = det.getIdProducto();
                  //se recupera el stock del producto
                  int stock = prodF.getStock();
                  //se recupera la cantidad comprada del objeto
                  double cantidad = det.getCantidad();
                  //se suma el stock en la cantidad aumentada gracias a la compra efectiva
                  int nuevostock = (int) (Math.round(cantidad) +stock);
                  //se edita el stock del producto
                  prodF.setStock(nuevostock);
                  // se inserta el producto editado en la base de datos
                  productoFacade.edit(prodF);
                }   
            }
            List<Detalle> detallesCompraActual = detalleFacade.findAll();
           // out.println("ID ULTIMA COMPRA "+idcompraActual+"<br>");
            for (int i = 0; i < detallesCompraActual.size(); i++) {
                Detalle d = detallesCompraActual.get(i); 
                Compra compraDetalle = d.getIdCompra();
                int idcompraDetalle = compraDetalle.getIdCompra();
                if (idcompraDetalle == idcompraActual) {
                  //  out.println("<br>");
                  //  out.println("Iguales: <br>");
                   // out.println("detalle:"+d.getIdDetalle()+""+ d.getIdCompra()+"<br>"); 
                   // out.println("<br>");
                }else{                 
                  //  out.println("Eliminado "+d.getIdDetalle());
                   // out.println("||");
                    detallesCompraActual.remove(i);
                    i--;
                }   
            }
        //    out.println("<br>");
          //  out.println("Lista final:");
          //  out.println("<br>");
         //   out.println(""+detallesCompraActual);  

           
            
            request.setAttribute("detallesCompraActual",detallesCompraActual);
            request.setAttribute("tipodoctrans", tipodoctrans);      
            request.setAttribute("comp", comp);

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
