<%@ include file="include/imports.jsp" %>
<%
    int recipeId = Integer.parseInt(request.getParameter("recipeId"));
    String previousPage = request.getParameter("page");
    
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=recipeName%> - HappyCook</title>
       <jsp:include page="include/header.jsp" flush="true" />
    </head>
    <body>
        <jsp:include page="include/nav.jsp" flush="true" />
        <div class="row">  
             <div class="col-md-12">
     
            <a href=<%=previousPage%>>Back</a> &nbsp>&nbsp <%=recipeName%>
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
                <h3>Ingredients List</h3> <!--ingredients-->
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
            <h3>Instructions</h3>
            <p><%=instruction%></p>
        </div>
        <div class="col-md-12">
            <h3>Nutrition</h3>
            <p><%=nutrition%></p>
        </div>
        </div>
        <jsp:include page="include/footer.jsp" flush="true" />
    </body>
</html>