package controlador.TipoOrigenVenta;
import entidades.TipoOrigenVenta;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.TipoOrigenVentaFacadeLocal;

public class TipoOrigenVentaAgregarServlet extends HttpServlet {

    @EJB
    private TipoOrigenVentaFacadeLocal tipoOrigenVentaFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String tipoOrigen = request.getParameter("txt_tipo_origen_venta");
            
            TipoOrigenVenta tipoOrigenVenta = new TipoOrigenVenta();
            
            tipoOrigenVenta.setTipoOrigen(tipoOrigen);            
            //insertar objeto en base de datos
           tipoOrigenVentaFacade.create(tipoOrigenVenta);
            
           // out.println(tipoOrigenVenta.getTipoOrigen());
                        
            RequestDispatcher rd = request.getRequestDispatcher("listar");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}