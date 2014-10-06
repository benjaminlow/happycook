<%-- 
    Document   : allRecipes
    Created on : Oct 5, 2014, 9:48:31 PM
    Author     : pyaephyo
--%>

<%
    session.invalidate();
%>    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Cook-All Recipes</title>
        <!-- Bootstrap -->
        
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <ul class="nav navbar-nav">
                        <li><a href="home.jsp">Logo</a></li>
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="allRecipes.jsp">All Recipes</a></li>
                        <li><a href="myRecipesList.jsp">My Recipes List</a></li>
                        <!-- pull the social media icon to the right hand corner -->
                        <li><a href="#">Facebook icon</a></li>
                        <li><a href="#">Twitter icon</a></li>
                        <li><a href="#">Social Media icon</a></li>
                    </ul>
                </div>    
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <br/>
        <div class="container"> <div class="row">
        <div class="col-md-3">
            <div id="sidebar" data-spy="affix" data-offset-top="80"> 
            <form class="col-md-12 form-horizontal" name="searchRecipes" action="processSearch" method="post">
            <label class="control-label">Recipe Search Box</label><br/>
                <div class="form-group">
                    <label class="control-label">Recipe</label><br/>
                    <input type="text" class="form-control" name="recipe" placeholder="recipe name">
                </div>
                <div class="form-group">
                    <label class="control-label">Ingredients</label><br/>
                    <input type="text" class="form-control" name="ingredient" placeholder="ingredients">
                </div>
                
                <div class="form-group">    
                    <label class="control-label">Cuisines</label>
                    <input type="text" class="form-control" name="cuisine" placeholder="cuisine">
                </div>      
                <div class="form-group">
                    <label class="control-label">Preparation Time</label>
                    <input type="text" class="form-control" name="prepartiontime" value="">

                </div>    
                <div class="form-group">
                    <label class="control-label">Diets</label>
                    <input type="text" class="form-control" name="cuisine" placeholder="">
                </div>     
                <div class="form-group">
                    <label class="control-label">Cooking Type</label>
                    <input type="text" class="form-control" name="cuisine" placeholder="">
                </div>  
                <div class="form-group">
                    <label class="control-label">Allergies</label>
                    <input type="text" class="form-control" name="cuisine" placeholder="">
                </div>  
                
                <button type="submit" class="btn btn-primary">Search Recipes</button>
                <button type="submit" class="btn btn-info">Clear</button> <br/>
                <a class="btn" data-toggle="collapse" data-target="#viewdetails">Collapse</a>
            </form>
            </div>    
        </div>
        <div class="col-md-9"></div>        
        
        </div><!--row--> </div> <!--container-->
    </body>
</html>
