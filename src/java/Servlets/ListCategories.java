
package Servlets;

import DataLayer.DbConnexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListCategories extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        DbConnexion db = new DbConnexion();
        request.setAttribute("listCategories", db.getAllCategories());
        
        if(request.getParameter("cat_id")!=null)
            db.deleteCategory(request.getParameter("cat_id"));
        
        request.getRequestDispatcher("listCategories.jsp").forward(request, response);
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DbConnexion dbcon = new DbConnexion();
        dbcon.addCategorie(request.getParameter("catName"));
        response.sendRedirect("ListCategories");
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
