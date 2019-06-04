
package Servlets;

import DataLayer.DbConnexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ModifierArticle extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
        }
    }

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Connexion a la base de données
       DbConnexion dbc = new DbConnexion();
       
       //Recuperation des categories depuis la base de données 
       request.setAttribute("categories", dbc.getAllCategories());
       //Recuperation des paramètres url
       request.setAttribute("ades", request.getParameter("a_des"));
       request.setAttribute("id_art", request.getParameter("a_id"));
       request.setAttribute("cat", request.getParameter("cat"));  
        request.getRequestDispatcher("modifierArticle.jsp").forward(request, response);
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Récuperation des champs du formulaire dans la page JSP associé
        String art_id = request.getParameter("artId");
        String art_des = request.getParameter("artDes");
        String cat_id = request.getParameter("categorie");
        //Intance de connexion à la BD
        DbConnexion d = new DbConnexion();
        //Modification
        d.modifierArticle(art_des, cat_id, art_id);
        
        response.sendRedirect("ListArticles");
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
