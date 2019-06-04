
package Servlets;

import DataLayer.DbConnexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListArticles extends HttpServlet {

    
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
        
         request.setAttribute("liste_articles", db.getAllarticles());
         request.setAttribute("liste_categories", db.getAllCategories());
         
         if(request.getParameter("a_id")!= null){
             db.deleteArticle(request.getParameter("a_id"));
             
         }
        
        request.getRequestDispatcher("listArticle.jsp").forward(request, response);
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DbConnexion db = new DbConnexion();
        String  a_des = request.getParameter("artDes");
        String  cat_id = request.getParameter("categorie");
        
        db.addArticle(a_des, cat_id);
       
        response.sendRedirect("ListArticles");
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
