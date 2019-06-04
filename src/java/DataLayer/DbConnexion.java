
package DataLayer;

import Classes.Article;
import Classes.Categorie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class DbConnexion {
    
    private Connection conn;
    private Statement stmt;
    private ResultSet rs;
/**
 * Connexion à la BD dans constructeur
 */
   public DbConnexion(){
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/gestion";
            String user = "root";
            String password ="";
            
            conn = DriverManager.getConnection(url,user,password);
            stmt = conn.createStatement();
            
        }catch(Exception ex){
            System.out.println("Database error : "+ex);
        }
            
        
    }

   
    //Getters Setters
    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public Statement getStmt() {
        return stmt;
    }

    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }
    
    //Les méthodes
    
    /**
     * Retourne la liste des articles de la BD
     * @return 
     */
     public List<Article> getAllarticles(){
        
        List<Article> listArt = new ArrayList<>();
        
       try{
           
                   ResultSet rslt = this.stmt.executeQuery("SELECT a.PK_article, a.Art_des, c.Cat_des FROM articles a INNER JOIN categories c on a.FK_cat = c.PK_categorie ");
                   while(rslt.next()){
                       listArt.add(new Article(rslt.getString("pk_article"),rslt.getString("art_des"), rslt.getString("cat_des")));
                       
                   }
       }catch(Exception e){
           System.out.println("erreur: "+e.getMessage());
           e.printStackTrace();
           
       }
        
        return listArt;
        
    }
     
     //Retourne la liste des categories de la base de données
     public List<Categorie> getAllCategories(){
         
         List<Categorie> listCat = new ArrayList<>();
         
         try{
             
             ResultSet st = this.getStmt().executeQuery("SELECT * FROM categories");
             while(st.next()){
                 listCat.add(new Categorie(st.getString("cat_des"),Integer.parseInt(st.getString("pk_categorie"))));
                 
             }
             
         }catch(Exception er){
             System.out.println("cat_error :"+er.getMessage());
             er.printStackTrace();
             
         }
        
        
        return listCat;
    }
     
     /**
      * Ajoute un article dans la base de données
      * @param des
      * @param idCat 
      */
     public void addArticle(String des, String idCat){
         
         String sql = "INSERT INTO articles (art_des, fk_cat) VALUES(?,?)";
         try{
             
             PreparedStatement pstmt = this.getConn().prepareStatement(sql);
             pstmt.setString(1, des);
             pstmt.setString(2,idCat);
             
             pstmt.executeUpdate();
             
         }catch(Exception err){
             System.out.println("AddArticle error: "+err);
         }
     }
     
     /**
      * Supprime un article dans la base de données
      * @param art_id 
      */
     public void deleteArticle(String art_id){
         
             String sql = "DELETE FROM articles WHERE PK_article = ?";
             
            try{
                
                PreparedStatement pst = this.getConn().prepareStatement(sql);
                
                pst.setString(1,art_id);
                
                pst.executeUpdate();
                
            }catch(Exception delErr){
                System.out.println("Delete_err :"+delErr);
            }
                  

         
     }
     
     /**
      * Modifie les propriétés d'un article dans la base de données
      * @param a_des
      * @param idCat
      * @param art_id 
      */
     public void modifierArticle(String a_des, String idCat, String art_id){
         
         String sql ="UPDATE articles SET Art_des = ?, FK_cat = ? WHERE PK_article = ?";
         
          try{
                
                PreparedStatement pst = this.getConn().prepareStatement(sql);
                
                pst.setString(1,a_des);
                pst.setString(2,idCat);
                pst.setString(3,art_id);
                pst.executeUpdate();
                
            }catch(Exception UpdtErr){
                System.out.println("Modifier_err :"+UpdtErr);
            }
          
         
     }
     
     /**
      * Supprime une categorie dans la base de données
      * @param id 
      */
     public void deleteCategory(String id){
         String sql = "DELETE FROM categories WHERE PK_categorie = ?";
         
        try{
            
            PreparedStatement pst = this.getConn().prepareStatement(sql);
            pst.setString(1, id);
            pst.executeUpdate();
            
        }catch(Exception er){
            System.out.println("DeleCat_err: "+er);
        }
     }
     
     /**
      * Ajoute une categorie dans la BD
      * @param cat_des 
      */
     public void addCategorie(String cat_des){
         
         String sql = "INSERT INTO categories (cat_des) VALUES(?)";
         try{
             
             PreparedStatement pstmt = this.getConn().prepareStatement(sql);
             pstmt.setString(1, cat_des);
               
             pstmt.executeUpdate();
             
         }catch(Exception err){
             System.out.println("AddCategorie error: "+err);
         }
         
     }
     
     /**
      * Modifie les propriétés d'une categorie
      * @param id
      * @param cat_des 
      */
     public void modifierCategorie(String id, String cat_des){
         String sql ="UPDATE categories SET Cat_des = ? WHERE PK_categorie = ?";
         
         try{
                
                PreparedStatement pst = this.getConn().prepareStatement(sql);
                
                pst.setString(1,cat_des);
                pst.setString(2,id);
                
                pst.executeUpdate();
                
            }catch(Exception UpdtCatErr){
                System.out.println("ModifierCat_err :"+UpdtCatErr);
            }
     }
    
}
