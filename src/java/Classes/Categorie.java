
package Classes;

import java.util.ArrayList;


public class Categorie {
    
    private String cat_description;
    private int id;

    public Categorie() {
    }

    public Categorie(String cat_description, int id) {
        this.cat_description = cat_description;
        this.id = id;
    }
    
    

    public String getCat_description() {
        return cat_description;
    }

    public void setCat_description(String cat_description) {
        this.cat_description = cat_description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
}
