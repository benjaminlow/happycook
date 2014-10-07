<%@ include file="imports.jsp" %>
<%      
    String pageName = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
%>    
<div id="wrap">  
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header"> 
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>                               
                <a class="navbar-brand" href="<%=request.getContextPath()%>/home.jsp" title="Home - HappyCook"><img src="images/HappyCook.png" style="max-width:165px; margin-top: -7px;"/></a>                
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">  
                    <% if (pageName.equals("home.jsp")) {%> 
                    <li class="active">
                        <% } else {%>
                    <li> <% }%>
                        <a href="home.jsp">Home</a></li> 
                    <% if (pageName.equals("allRecipes.jsp")) {%> 
                    <li class="active">
                        <% } else {%>
                    <li> <% }%>
                        <a href="allRecipes.jsp">All Recipes</a></li>            
                        <% if (pageName.equals("myRecipesList.jsp")) {%> 
                    <li class="active">
                        <% } else {%>
                    <li> <% }%>
                        <a href="myRecipesList.jsp">My Recipes List</a></li>                        
                </ul>
                <ul class="nav navbar-nav pull-right">   
                    <li><a href="#">Facebook Icon</a></li>
                    <li><a href="#">Twitter Icon</a></li>
                    <li><a href="#">Other Social Media Icons</a></li>                                                           
                </ul>                               
            </div>
        </div>
    </div>       
    <div class="container">