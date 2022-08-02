
package controlador.Empleado;

import entidades.CargoEmpleado;
import entidades.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.CargoEmpleadoFacadeLocal;
import sessionBean.EmpleadoFacadeLocal;


public class EmpleadoModificarServlet extends HttpServlet {

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;

    @EJB
    private CargoEmpleadoFacadeLocal cargoEmpleadoFacade;
    
    

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int idEmpleado = Integer.parseInt(request.getParameter("hdn_id_empleado"));
            int idCargoEmpleado = Integer.parseInt(request.getParameter("cbx_cargo_empleado"));
           
            int rutEmpleado         = Integer.parseInt(request.getParameter("txt_rut_empleado"));
            String dvEmpleado       = request.getParameter("txt_dv_empleado");
            String nombreEmpleado   = request.getParameter("txt_nombre_empleado");
            String apellidoPaterno  = request.getParameter("txt_apellido_paterno");
            String apellidoMaterno  = request.getParameter("txt_apellido_materno");
            int telefonoEmpleado    = Integer.parseInt(request.getParameter("txt_telefono_empleado"));
            String correoEmpleado   = request.getParameter("txt_correo_empleado");
            
            CargoEmpleado cargemp = cargoEmpleadoFacade.find(idCargoEmpleado);
            
            Empleado emp = empleadoFacade.find(idEmpleado);
            
            emp.setIdCargoEmpleado(cargemp);
            emp.setRutEmpleado(rutEmpleado);
            emp.setDvEmpleado(dvEmpleado);
            emp.setNombreEmpleado(nombreEmpleado);
            emp.setApellidoPaterno(apellidoPaterno);
            emp.setApellidoMaterno(apellidoMaterno);
            emp.setTelefonoEmpleado(telefonoEmpleado);
            emp.setCorreoEmpleado(correoEmpleado);
            
            empleadoFacade.edit(emp);
            
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
