/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Login;

import entidades.Empleado;
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

/**
 *
 * @author Barriga
 */
public class LoginServlet extends HttpServlet {

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //Recuperamos los valores de "rut" y "contraseña" de los input que lleno el usuario en el login.jsp
            //rut
            int rutlog = Integer.parseInt(request.getParameter("txtrutlogin"));
            //password
            String passlog = request.getParameter("txtpasslogin");
            //Creamos un objeto de la lista de Empleados de la base de datos
            List<Empleado> listaEmpleados = empleadoFacade.findAll();
            //Creamos una variable string llamada ruta con valor nulo para posteriormente asignarle valor segun la condicion
            String ruta = null;
            //Se define un elemento estatico con un valor no existente en la base de datos, con el fin de controlar errores
            int idUsuarioValidado = -1;
            //Se implemente un ciclo for que recorrera la lista de los empleados de la base de datos
            for (int i = 0; i < listaEmpleados.size(); i++) {
                //Creamos un objeto de Empleado y le asignamos la posicion, en este caso la ID que se esta recorriendo con el valor de i.
                Empleado emple      = listaEmpleados.get(i);
                //Definimos un elemento estatico de tipo entero y le asignamos el rut del empleado de la base de datos que se encuentra en esa posicion.
                int rutEmpleado     = emple.getRutEmpleado();
                //Definimos un elemento estatico de tipo string y le asignamos la contraseña del empleado de la base de datos que se encuentra en esa posicion.
                String passEmpleado = emple.getPasswordEmpleado();
                //Incorporamos una condición que evalua si el rut y la contraseña que ingreso el usuario en el jsp
                // coincide con las credenciales del empleado que se esta iterando en la posicion del ciclo for.
                if(rutlog == rutEmpleado  && passlog.equals(passEmpleado)  ){
                    //primero asignamos a nuestro elemento estatico nulo el ID del empleado.
                    idUsuarioValidado = emple.getIdEmpleado();
                    //Si la condicion se cumple, entonces la ruta nos llevara al inicio.jsp
                    ruta = "../inicio.jsp";
                    //en este punto si la condicion se cumple entonces saldremos del ciclo.
                    break;
                } else {
                    //Si la condicion no se cumple, entonces la ruta nos llevara al jsp que indica
                    // al usuario que sus credenciales son incorrectas.
                    ruta = "error-login-rut.jsp";
                }
            }
            //Creamos un nuevo objeto de tipo Empleado para llevarlo al siguiente jsp y
            // le asignamos a través del metodo Find el id del usuario validado.
            Empleado empleValidado = empleadoFacade.find(idUsuarioValidado);
            
            //Se envia el objeto de tipo Empleado que fue validado en el login
            request.setAttribute("empleValidado", empleValidado);
            //reedirecionamos al resultado de la ruta que nos lleva al jsp.
            RequestDispatcher rd = request.getRequestDispatcher(ruta);
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
