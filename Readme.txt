
PROJET JOS

Plateforme de developpement : JEE

IDE: Netbeans 8.2

Database : MySql

Nom du fichier base de données : gestion.sql

Serveur Database : Wamp/ phpMyAdmin

Serveur web : GlasFish 4.1.1

Nom du projet : CRUD_PROJET

Aborescence du Source Package: 

	-> Classes : Contient les entités (Article.java, Categorie.java)
        -> DataLayer : Contient la connexion à la base de données et toute les méthodes CRUD pour chaque entité (Dbconnexion.java)
   	-> Servlets : Contient toutes les Servlets (ListArticles.java, ModifierCategories.java, ModifierArticles.java, ListCategories.java)

Web Pages : Contient les pages JSP.

le fichier /WEB-INF/web.xml contient les configurations des servlets.

Quelques Indications sur le fonctionnement.

Le top menu contient deux liens : Articles et Categories

Le menue Categories affiche la liste des categories et permet de filtrer la liste des articles 

Lien de d'accès à la partie articles : http://localhost:8080/CRUD_PROJET/ListArticles

Lien de d'accès à la partie categorie : http://localhost:8080/CRUD_PROJET/ListCategories

NB: Lors de la supression (Article/Categorie), prière de reactualiser la page ou simple de cliquer sur le lien Article dans le top menu afin de constater la suppression




		