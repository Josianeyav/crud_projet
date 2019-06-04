<%-- 
    Document   : modifierCategorie
    Created on : 3 juin 2019, 13:16:50
   
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier Categorie</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body>
         <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.html">PROJET CRUD</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item">
                    <a class="nav-link" href="ListArticles">Articles</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="ListCategories">Categories</a>
                </li>
                
            </ul>
        </div>
    </div>
</nav>
       <br/>
       
          <div class="container">
        
      <div class="row">
          
         
          
       <div class="col-12 col-sm-9">
          
        <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h1 class="m-0 font-weight-bold text-primary">Modifier Categorie</h1>
            </div>
            
            <div class="card-body">
              <form method="post">
            <div class="modal-body mx-3">
                
                 <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">ID Categorie</label>
                    <input type="text" id="orangeForm-name" name="catId" class="form-control validate" value="${cat_id}" readonly>
                    
                </div>
                    
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">Nom Categorie</label>
                    <input type="text" id="orangeForm-name" name="catDes" class="form-control validate" value="${cat_name}">
                    
                </div>
                
                  
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-primary" type="submit" name="register">Enregistrer modifications</button>
            </div>
            </form>
             
            </div>
          </div>
           
       </div>
          
      </div>
    </div>
    </body>
</html>
