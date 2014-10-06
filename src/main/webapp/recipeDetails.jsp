<%-- 
    Document   : recipeDetails
    Created on : Oct 6, 2014, 2:23:48 PM
    Author     : pyaephyo
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="happyCook.*"%>
<%
    int recipeId = Integer.parseInt(request.getParameter("recipeId"));
    String previousPage = request.getParameter("page");
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
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "";
            String instruction = "";
            String nutrition = "";
            String recipeName = "";
            String cuisine = "";
            double prepTime = 0;
            String diet = "";
            String cookingType = "";
            String allergy = "";
            String imagePath = "";
            int rating = 0;
            try {
                conn = ConnectionManager.getConnection();
                sql = "SELECT * FROM recipedetails where recipe_id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, recipeId);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    instruction = rs.getString(2);
                    nutrition = rs.getString(3);    
                }
                sql = "SELECT * FROM recipe where recipe_id=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, recipeId);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    recipeName = rs.getString(2);
                    cuisine = rs.getString(3);
                    prepTime = rs.getDouble(4);
                    diet = rs.getString(5);
                    cookingType = rs.getString(6);
                    allergy = rs.getString(7);
                    imagePath = rs.getString(8);
                    rating = rs.getInt(9);
                }
            } catch (SQLException ex) {
                String msg = "Unable to access data; SQL=" + sql + "\n";
                throw new RuntimeException(msg, ex);            
            } finally {
                ConnectionManager.close(conn, pstmt, rs);
            }
        %>

        <div class="col-md-12">
            <a href=<%=previousPage%>>back</a> &nbsp>&nbsp <%=recipeName%>
            <h3><%=recipeName%>&nbsp&nbsp Rating - <%=rating%></h3> 
            
            <div class="col-md-4"><img src="<%=imagePath%>"></div> 
            <div class="col-md-4"><img src="<%=imagePath%>"></div>
            <div class="col-md-4"><img src="<%=imagePath%>"></div>
        </div>
        <div class="col-md-12">
            <div class="col-md-6">
                <h3>Recipe Type</h3>
                <table class="table table-bordered table-hover table-condensed">
                    <tr><td>Cuisine Type</td><td><%=cuisine%></td></tr>
                    <tr><td>Preparation Time</td><td><%=prepTime%></td></tr>
                    <tr><td>Diet</td><td><%=diet%></td></tr>
                    <tr><td>Cooking Type</td><td><%=cookingType%></td></tr>
                    <tr><td>Allergy</td><td><%=allergy%></td></tr>
                </table>
            </div>
                
            <div class="col-md-6">
                <h3>Ingredient List</h3> <!--ingredients-->
                <table class="table table-bordered table-hover table-condensed">
                    <tr><td>Cuisine Type</td><td><%=cuisine%></td></tr>
                    <tr><td>Preparation Time</td><td><%=prepTime%></td></tr>
                    <tr><td>Diet</td><td><%=diet%></td></tr>
                    <tr><td>Cooking Type</td><td><%=cookingType%></td></tr>
                    <tr><td>Allergy</td><td><%=allergy%></td></tr>
                </table>
            </div>
        </div>   
        <div class="col-md-12">        
            <h3>Instruction</h3>
            <p><%=instruction%></p>
        </div>
        <div class="col-md-12">
            <h3>Nutrition</h3>
            <p><%=nutrition%></p>
        </div>
        </div><!--row--> </div> <!--container-->
    </body>
</html>
