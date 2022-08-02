
package controlador.Producto;

import entidades.Categoria;
import entidades.Producto;
import entidades.SubCategoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sessionBean.CategoriaFacadeLocal;
import sessionBean.ProductoFacadeLocal;
import sessionBean.SubCategoriaFacadeLocal;


public class ProductoBuscarServlet extends HttpServlet {

    @EJB
    private SubCategoriaFacadeLocal subCategoriaFacade;

    @EJB
    private CategoriaFacadeLocal categoriaFacade;

    @EJB
    private ProductoFacadeLocal productoFacade;

    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
          int idProducto =  Integer.parseInt(request.getParameter("id"));
          Producto produ = productoFacade.find(idProducto);
          
          List<Categoria> categorias = categoriaFacade.findAll();
          List<SubCategoria> subcategorias = subCategoriaFacade.findAll();
          
          request.setAttribute("categorias", categorias);
          request.setAttribute("subcategorias", subcategorias);
          request.setAttribute("produ",produ);
          
          RequestDispatcher rd = request.getRequestDispatcher("modificar-producto.jsp");
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
