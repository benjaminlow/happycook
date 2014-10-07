<%@ include file="include/imports.jsp" %>
<%
    HashMap<Integer,String> _myRecipesList = (HashMap<Integer,String>) session.getAttribute("myRecipeList");
    HashMap<String, String> myIngredientList = new HashMap<String, String>(); 
    String tmp = (String) request.getParameter("sorting");
    if (tmp == null) {
        tmp = "name";
    } 
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>My Recipes List - HappyCook</title>
        <jsp:include page="include/header.jsp" flush="true" />
    </head>
    <body>
        <jsp:include page="include/nav.jsp" flush="true" />
        <div class="row">
        <div class="col-md-12">
            <% 
            if (_myRecipesList == null || _myRecipesList.isEmpty() ) {
            %>
                <br>Hi, you do not have any items in your Recipes List yet.
            <%
            } else {
            %> 
                <button class="btn btn-primary" onclick="location.href='processRemoveRecipefromList?page=myRecipesList.jsp'">Clear All</button>
                <button class="btn btn-info" data-toggle="modal" data-target="#myModal">Generate Grocery List</button><br/><br/>
        </div>
        <div class="col-md-12">       
            <%
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
                String ingredientsStr = "";
                int ingredientsCount = 0;
                String ingredient = "";
                String measurement = "";
                String amountStr = "";
                double amount = 0;

                try {
                  conn = ConnectionManager.getConnection();
                  
                  for (int recipeId: _myRecipesList.keySet()) {
                    sql = "SELECT * FROM recipe where recipe_id=?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, recipeId);
                    rs = pstmt.executeQuery();
                    while (rs.next()) {
                        recipe_id = rs.getInt(1);
                        recipe_name = rs.getString(2);
                        cuisine = rs.getString(3);
                        prep_time = rs.getDouble(4);
                        image_Path = rs.getString(8);
                        rating = rs.getInt(9);
                        ingredientsStr = "";
                        ingredientsCount = 0;
                        sql = "SELECT * FROM ingredient where recipe_id=?";
                        pstmt2 = conn.prepareStatement(sql);
                        pstmt2.setInt(1, recipeId);
                        rs2 = pstmt2.executeQuery();
                        while (rs2.next()) {
                            ingredientsCount++;
                            ingredient = rs2.getString(1);
                            amount = rs2.getDouble(2);
                            measurement = rs2.getString(3);
                            ingredientsStr += ingredient + ", ";
                            amountStr = amount + " " + measurement;
                            //hashmap of myIngredientLists
                            if (myIngredientList.containsKey(ingredient)) {
                                amountStr = myIngredientList.get(ingredient);
                                amount += Double.parseDouble(amountStr.substring(0, amountStr.indexOf(" ")));
                                amountStr = amount + " " + amountStr.substring(amountStr.indexOf(" "));
                            } 
                            myIngredientList.put(ingredient, amountStr);
                        }
          %>
                          <div class="col-md-3">
                              <table class="table table-bordered table-hover table-condensed">
                                  <tr><td><a href="recipeDetails.jsp?recipeId=<%=recipe_id%>&page=myRecipesList.jsp"><%=recipe_name%></a></td><td><%=rating%></td></tr>
                                  <tr><td colspan="2" align="center"><a href="recipeDetails.jsp?recipeId=<%=recipe_id%>&page=myRecipesList.jsp"><img src="<%=image_Path%>" class="img-rounded"></a></td><tr/>
                                  <tr><td colspan="2"><%=ingredientsStr%></td><tr/>
                                  <tr><td colspan="2">Time: <%=prep_time%> mins, <%=ingredientsCount%> ingredients</td></tr>
                                  <tr>
                                      <td>sharefacebookicon</td>
                                      <td align="right">
                                          <button class="btn btn-danger" onclick="location.href='processRemoveRecipefromList?recipeId=<%=recipe_id%>&page=myRecipesList.jsp'">
                                              Remove</button></td>
                                  </tr>
                              </table><br/>
                          </div>
          <%
                      }
                    }
                } catch (SQLException ex) {
                    String msg = "Unable to access data; SQL=" + sql + "\n";
                    throw new RuntimeException(msg, ex);            
                } finally {
                    ConnectionManager.close(conn, pstmt, rs);
                    ConnectionManager.close(conn, pstmt2, rs2);
                }
            }       
            %>                    
        </div>

        <!-- Modal -->
	
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                        </button>                        
                        <h3 class="modal-title" id="myModalLabel" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="images/HappyCook.png"/></h3>
                        <h3 class="modal-title" id="myModalLabel" align="center">My Grocery List</h3>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-hover table-condensed">
                            <th style="text-align: center;">Ingredient</th>
                            <th style="text-align: center;">Amount</th>
                        <%
                            //String ingredient = "";
                            //String amount = "";
                            if (myIngredientList != null && !myIngredientList.isEmpty()) {
                            for (String ingredient: myIngredientList.keySet()) {
                                String amount = myIngredientList.get(ingredient);  
                        %>
                            <tr><td style="text-align: center;"><%=ingredient%></td>
                                <td style="text-align: center;"><%=amount%></td></tr>
                        <%
                            }
                            }
                        %>                            
                        </table>    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        
        </div><!--row--> 
        <jsp:include page="include/footer.jsp" flush="true" />
    </body>
</html>