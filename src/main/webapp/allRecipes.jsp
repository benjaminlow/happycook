<%-- 
    Document   : allRecipes
    Created on : Oct 5, 2014, 9:48:31 PM
    Author     : pyaephyo
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="happyCook.*"%>
<%

    HashMap<Integer,String> myRecipeList = (HashMap<Integer,String>) request.getSession().getAttribute("myRecipeList");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs2 = null;
    String sql = "";
    int recipe_id = 0;
    String recipe_name = "";
    String cuisine = "";
    double prep_time = 0;
    String image_Path = "";
    int rating = 0;
    String ingredients = "";
    int ingredientsCount = 0;

    String sorting = request.getParameter("sorting");
    if (sorting != null) {
        request.getSession().setAttribute("sortedBy", sorting);
    }
    String sortedBy = (String) request.getSession().getAttribute("sortedBy");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy Cook-All Recipes</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>        <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>    </head>
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
                
                <button type="submit" class="btn btn-primary" onclick="location.href=''">Search Recipes</button>
                <button type="submit" class="btn btn-info">Clear</button> <br/>
                <a class="btn" data-toggle="collapse" data-target="#viewdetails">Collapse</a>
            </form>
            </div>    
        </div>
        <div class="col-md-9">
            <form name="sorting" action="allRecipes.jsp" method="post">
                <div class="radio"> 
                    <label> Order by </label>
            <%
                    if (sortedBy == null || sortedBy.equals("name")) {
                        sql = "SELECT * FROM recipe"; 
            %>
                        <label> <input type="radio" name="sorting" value="name" checked>name</input></label>
                        <label> <input type="radio" name="sorting" value="popularity" onclick="submit()">popularity</input></label>
            <%
                    } else {
                        sql = "SELECT * FROM recipe order by rating DESC;";
            %>
                        <label> <input type="radio" name="sorting" value="name" onclick="submit()">name</input></label>
                        <label> <input type="radio" name="sorting" value="popularity" checked>popularity</input></label>
            <%
                    }
            %>                                  
                </div>
            </form>
           
            
            
            <%  
                try {
                  conn = ConnectionManager.getConnection();
                  //sql = "SELECT * FROM recipe";
                  pstmt = conn.prepareStatement(sql);
                  rs = pstmt.executeQuery();
                    while (rs.next()) {
                        recipe_id = rs.getInt(1);
                        recipe_name = rs.getString(2);
                        cuisine = rs.getString(3);
                        prep_time = rs.getDouble(4);
                        image_Path = rs.getString(8);
                        rating = rs.getInt(9);
                        ingredients = "";
                        ingredientsCount = 0;
                        sql = "SELECT name FROM ingredient where recipe_id=?";
                        pstmt2 = conn.prepareStatement(sql);
                        pstmt2.setInt(1, recipe_id);
                        rs2 = pstmt2.executeQuery();
                        while (rs2.next()) {
                            ingredientsCount++;
                            ingredients += rs2.getString(1) + ", ";
                        }
            %>
                        <div class="col-md-4">
                            <table class="table table-bordered table-hover table-condensed">
                                <tr><td><a href="recipeDetails.jsp?recipeId=<%=recipe_id%>&page=allRecipes.jsp"><%=recipe_name%></a></td><td><%=rating%></td></tr>
                                <tr><td colspan="2" align="center"><a href="recipeDetails.jsp?recipeId=<%=recipe_id%>&page=allRecipes.jsp"><img src="<%=image_Path%>" class="img-rounded"></a></td><tr/>
                                <tr><td colspan="2"><%=ingredients%></td><tr/>
                                <tr><td colspan="2">Time: <%=prep_time%> mins, <%=ingredientsCount%> ingredients</td></tr>
                                <tr><td>sharefacebookicon</td>
            <%
                        if (myRecipeList == null || myRecipeList.isEmpty() || !myRecipeList.containsKey(recipe_id)) {
            %>
                                <td align="right">
                                        <button class="btn btn-success" onclick="location.href='processAddRecipetoList?recipeId=<%=recipe_id%>'">
                                            Add</button></td>
            <%
                        } else {
                            
            %>
                                <td align="right">
                                        <button class="btn btn-danger" onclick="location.href='processRemoveRecipefromList?recipeId=<%=recipe_id%>&page=allRecipes.jsp'">
                                            Remove</button></td>                                
            <%
                        }
            %>                  </tr>
                            </table><br/>
                        </div>
            <%
                    }
                } catch (SQLException ex) {
                    String msg = "Unable to access data; SQL=" + sql + "\n";
                    throw new RuntimeException(msg, ex);            
                } finally {
                    ConnectionManager.close(conn, pstmt, rs);
                    ConnectionManager.close(conn, pstmt2, rs2);
                }
            %>                    
        </div>
        </div><!--row--> </div> <!--container-->
    </body>
</html>
