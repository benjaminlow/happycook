<%@ include file="include/imports.jsp" %>
<%    
    session.removeAttribute("myRecipeList");    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Welcome to HappyCook!</title>
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
        .carousel-caption {            
            color: black;
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
            <h1>Make it Today! </h1>
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
 
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/crispyYogurtChicken.jpg" alt="...">
      <div class="carousel-caption">
          <h3>Crispy Yogurt Chicken...YUM</h3>
      </div>
    </div>
    <div class="item">
      <img src="images/popcornChicken.jpg" alt="...">
      <div class="carousel-caption">
          <h3>How about some popcorn chicken?</h3>
      </div>
    </div>
    <div class="item">
      <img src="images/pork.jpg" alt="...">
      <div class="carousel-caption">
          <h3>All time favourite, PORK!</h3>
      </div>
    </div>
  </div>
 
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div> <!-- Carousel -->
            
        </div>
        </div>
        <jsp:include page="include/footer.jsp" flush="true" />
    </body>
</html>