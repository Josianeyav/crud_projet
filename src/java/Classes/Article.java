
package Classes;

public class Article {
    private String id;
    private String a_description;
    private String categorie;

    public Article() {
    }

    public Article(String id,String a_description, String categorie) {
        this.id = id;
        this.a_description = a_description;
        this.categorie = categorie;
    }

    public String getA_description() {
        return a_description;
    }

    public void setA_description(String a_description) {
        this.a_description = a_description;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategorie() {
        return categorie;
    }

    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }
    
      
    
    
}
