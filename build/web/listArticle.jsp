<%-- 
    Document   : ajouterArticle
    Created on : 30 mai 2019, 23:35:44
 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <title>Liste Arricle</title>
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
          
          <div class="col-12 col-sm-3">
            <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                <ul class="list-group category_block">
                    <c:forEach var="c" items="${liste_categories}">
                        <li class="list-group-item" id="current_element${c.getId()}"><a href="#"  onclick="filterFunction(${c.getId()})">${c.getCat_description()}</a></li>
                    </c:forEach>
                    
                </ul>
            </div>
           <a href="#" class="btn btn-success btn-block" data-toggle="modal" data-target="#modalAjouterArticle">Ajouter un nouvel article</a>
        </div>
          
       <div class="col-12 col-sm-9">
          
        <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h1 class="m-0 font-weight-bold text-primary">Liste des articles</h1>
            </div>
            
            <div class="card-body">
              <div class="table-responsive">
                 
                <table class="table table-stripped" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                     <tr>
                      <th>Id</th>
                      <th>Description</th>
                       <th>Categorie</th>
                      <th>Modifier</th>
                      <th>Supprimer</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Id</th>
                      <th>Description</th>
                      <th>Categorie</th>
                      <th>Modifier</th>
                      <th>Supprimer</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    
                       <c:forEach var="i" items="${liste_articles}">
                             
                        <tr>

                            <td>${i.getId()}</td>
                            <td>${i.getA_description()}</td>
                            <td>${i.getCategorie()}</td>
                            <td><a href="ModifierArticle?a_des=${i.getA_description()}&a_id=${i.getId()}&cat=${i.getCategorie()}"><i class="fa fa-edit"> </i> Modifier </a></td>
                            <td><a href="?a_id=${i.getId()}"><i class="fa fa-trash"> </i> Supprimer </a></td>
                        </tr>
                        
                         </c:forEach>
                        
                  </tbody>
                </table>
              </div>
            </div>
          </div>
           
       </div>
          
      </div>
    </div>
        
        
        
<!-- Ajouter article Modal-->
<div class="modal fade" id="modalAjouterArticle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Ajouter article</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post">
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">Description</label>
                    <input type="text" id="orangeForm-name" name="artDes" class="form-control validate">
                    
                </div>
                <div class="md-form mb-5">
                    <label data-error="wrong" data-success="right" for="orangeForm-name">Categorie</label>
                    <select class="form-control" id="exampleFormControlSelect1" name="categorie">
                        
                        <c:forEach var="c" items="${liste_categories}">
                         <option value="${c.getId()}">${c.getCat_description()}</option>
                         
                        </c:forEach>
      
                    </select>
                    
                </div>
                  
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-primary" type="submit" name="register">Ajouter</button>
            </div>
            </form>
        </div>
    </div>
</div>
        
 <script>
function filterFunction(position) {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("current_element"+position).innerText;
     
    
  filter = input.toUpperCase();
  table = document.getElementById("dataTable");
  //alert(input);
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
       
    </body>
</html>
