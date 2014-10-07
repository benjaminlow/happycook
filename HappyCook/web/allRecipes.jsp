<%@ include file="include/imports.jsp" %>
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
        <title>All Recipes - HappyCook</title>
        <jsp:include page="include/header.jsp" flush="true" />       
        <script>
            $(function(){
                $('#sl1').slider({                    
                    formater: function(value) {
                        //return 'Current value: '+value;
                        return value + ' minutes';
                    }             
                })
                .on('slide', function(ev){
                         $('#spana2').text($('#sl1').data('slider').getValue()+' min');
                });
            });   
            $(document).ready(function(){  
    $('#spana2').text($('#sl1').data('slider').getValue()+' min');
    $('#collapseOne').collapse("hide");
});

        </script>     
        <style> 
         .panel {
            border-width: 0;           
        }              
        </style>
      </head>
    <body>
        <jsp:include page="include/nav.jsp" flush="true" />
         <div class="row">
        <div class="col-md-3">
            <div id="sidebar" data-spy="affix" data-offset-top="600"> 
            <form class="col-md-12 form-horizontal" name="searchRecipes" action="processSearch" method="post">               
                <div class="form-group">                     
                    <label class="control-label">Recipe</label><br/>
                    <input type="text" class="form-control" name="recipe" placeholder="Recipe Name">
                </div>
                <div class="form-group">
                    <label class="control-label">Ingredients</label><br/>
                    <input type="text" class="form-control" name="ingredient" placeholder="Ingredients">
                </div>                                  
                
                <div class="panel-group form-group" id="accordion">
                     <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Show More Search Criteria <span class="glyphicon glyphicon-chevron-down"></span></a>
                </h4>
            </div>
                         <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body">
                    
                <div class="form-group">    
                    <label class="control-label">Cuisines</label>                                                              
                    <select class="selectpicker" name="cuisines" data-live-search="true" title="Chinese" multiple>
                            <option value="chinese">Chinese</option>
                            <option value="indian">Indian</option>
                            <option value="western">Western</option>
                            <option value="japanese">Japanese</option>
                            <option value="korean">Korean</option>
                    </select>
                </div>    
                
                <div class="form-group">
                    <label class="control-label">Preparation Time</label>                                       
                    <input type="text" class="span2" value="5" id="sl1" data-slider-min="5" data-slider-max="60"
                           data-slider-step="5" data-slider-value="30">                   
                    <br><h1><span class="label label-default" id="spana2"></span></h1>
                </div>               
            
               <div class="form-group">
                    <label class="control-label">Diets</label><br>
                   <select class="selectpicker" name="diets" data-live-search="true" title="Halal" multiple>
                            <option value="Halal">Halal</option>
                            <option value="vegetarian">Vegetarian</option>
                            <option value="lowfat">Low Fat</option>                            
                   </select>
                </div>     
                
                <div class="form-group">
                    <label class="control-label">Cooking Type</label><br>
                      <select class="selectpicker" name="cookingType" data-live-search="true" title="Steaming" multiple>
                            <option value="grilling">Grilling</option>
                            <option value="steaming">Steaming</option>
                            <option value="frying">Frying</option>                           
                      </select>
                </div>  
                
                <div class="form-group">
                    <label class="control-label">Allergies</label><br>
                      <select class="selectpicker" name="allergies" data-live-search="true" title="Seafood" multiple>
                            <option value="eggs">Eggs</option>
                            <option value="nuts">Nuts</option>
                            <option value="seafood">Seafood</option>                            
                      </select>
                </div>                                   
                            </div>
                        </div>
                    </div>       
                </div>        
            </div>                
                <button type="submit" class="btn btn-primary">Search</button>
                <button type="reset" class="btn btn-info">Clear</button><br/><br/>                                
            </form>                
            </div>  
        <div class="col-md-9">
            <form name="sorting" action="allRecipes.jsp" method="post">
                <div class="radio"> 
                    <label> Order by </label>
            <%
                    if (sortedBy == null || sortedBy.equals("name")) {
                        sql = "SELECT * FROM recipe"; 
            %>
                        <label> <input type="radio" name="sorting" value="name" checked>Name</input></label>
                        <label> <input type="radio" name="sorting" value="popularity" onclick="submit()">Popularity</input></label>
            <%
                    } else {
                        sql = "SELECT * FROM recipe order by rating DESC;";
            %>
                        <label> <input type="radio" name="sorting" value="name" onclick="submit()">Name</input></label>
                        <label> <input type="radio" name="sorting" value="popularity" checked>Popularity</input></label>
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
        </div>
        <jsp:include page="include/footer.jsp" flush="true" />
    </body>
</html>