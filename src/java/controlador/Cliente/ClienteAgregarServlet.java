package controlador.Cliente;

import entidades.Cliente;
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
import sessionBean.ClienteFacadeLocal;

/**
 *
 * @author john-
 */
public class ClienteAgregarServlet extends HttpServlet {

    @EJB
    private ClienteFacadeLocal clienteFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            
            
            int rutCliente = Integer.parseInt(request.getParameter("txt_rut_cliente"));
            String dvCliente = request.getParameter("txt_dv_cliente");
            String nombreCliente = request.getParameter("txt_nombres_cliente");
            String apellidoPaternoCliente = request.getParameter("txt_apellido_paterno_cliente");
            String apellidoMaternoCliente = request.getParameter("txt_apellido_materno_cliente");
            String direccionCliente = request.getParameter("txt_direccion_cliente");
            int telefonoCliente = Integer.parseInt(request.getParameter("txt_telefono_cliente"));
            String correoCliente = request.getParameter("txt_correo_cliente");
            String passwordCliente = request.getParameter("txt_password_cliente");  
            Date fechaRegistro = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd  hh:mm:ss a");
            ft.format(fechaRegistro);
            Cliente cli = new Cliente();
            
            cli.setRutCliente(rutCliente);
            cli.setDvCliente(dvCliente);
            cli.setNombreCliente(nombreCliente);
            cli.setApellidoPaternoCliente(apellidoPaternoCliente);
            cli.setApellidoMaternoCliente(apellidoMaternoCliente);
            cli.setDireccionCliente(direccionCliente);
            cli.setTelefonoCliente(telefonoCliente);
            cli.setCorreoCliente(correoCliente);
            cli.setPasswordCliente(passwordCliente);
            cli.setFechaRegistro(fechaRegistro);

            //insertar objeto en base de datos
             clienteFacade.create(cli);
                        
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