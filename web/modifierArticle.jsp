<%-- 
    Document   : modifierArticle
    Created on : 30 mai 2019, 23:36:31
   
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier articles</title>
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
              <h1 class="m-0 font-weight-bold text-primary">Modifier Article</h1>
            </div>
            
            <div class="card-body">
              <form method="post">
            <div class="modal-body mx-3">
                
                 <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">ID Article</label>
                    <input type="text" id="orangeForm-name" name="artId" class="form-control validate" value="${id_art}" readonly>
                    
                </div>
                    
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">Description</label>
                    <input type="text" id="orangeForm-name" name="artDes" class="form-control validate" value="${ades}">
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">Categorie</label>
                    <select class="form-control" id="exampleFormControlSelect1" name="categorie">
                       
                        <c:forEach var='k' items="${categories}">
                            
                            <option value="${k.getId()}">${k.getCat_description()}</option>
                        </c:forEach>
      
                    </select>
                    
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
