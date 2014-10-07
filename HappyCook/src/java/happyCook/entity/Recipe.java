/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package happyCook.entity;

import java.util.ArrayList;

/**
 *
 * @author pyaephyo
 */
public class Recipe {
    
    //attributes
    private static int recipe_count = 0;
    private int recipe_id;
    private String recipe_name;
    private ArrayList<Ingredient> ingredientList;
    private String cuisine;
    private double prep_time;
    private String diet;
    private String cookingType;
    private ArrayList<String> allergies;
    private String imagePath;
    private int rating;


    /*
     * constructor
     * @param recipe_name  
     * @param ingredientList: list of ingredients for recipe 
     * @param prep_time: preparation time of recipe
     * @param diet: diet type of recipe
     * @parama cookingType: cooking type of recipe
     * @parama allergies: list of allergy 
     */
    public Recipe(String recipe_name, ArrayList<Ingredient> ingredientList, String cuisine, 
            double prep_time, String diet, String cookingType, ArrayList<String> allergies, 
            String imagePath, int rating) {
        this.recipe_name = recipe_name;
        this.ingredientList = ingredientList;
        this.cuisine = cuisine;
        this.prep_time = prep_time;
        this.diet = diet;
        this.cookingType = cookingType;
        this.allergies = allergies;
        this.imagePath = imagePath;
        this.rating = rating;
    }
    
        /*
     * constructor
     * @param recipe_name  
     * @param ingredientList: list of ingredients for recipe 
     * @param prep_time: preparation time of recipe
     * @param diet: diet type of recipe
     * @parama cookingType: cooking type of recipe
     * @parama allergies: list of allergy 
     */
    public Recipe() {
        recipe_id = recipe_count +1;
        recipe_name = "";
        ingredientList = null;
        cuisine = "";
        prep_time = 0;
        diet = "";
        cookingType = "";
        allergies = null;
        imagePath = "";
        rating = 0;
    }
    
    /*
    * @return the recipe id
    */ 
    public int getRecipe_id() {
        return recipe_id;
    }

    /*
    * @return the recipe name
    */ 
    public String getRecipe_name() {
        return recipe_name;
    }

    /*
    * change the name of recipe
    * @param recipe_name
    */
    public void setRecipe_name(String recipe_name) {
        this.recipe_name = recipe_name;
    }

    /*
    * @return the list of ingredients of recipe
    */ 
    public ArrayList<Ingredient> getIngredientList() {
        return ingredientList;
    }

    /*
     * change the ingredient list of recipes
     * @param arraylist of ingredients
     */    
    public void setIngredientList(ArrayList<Ingredient> ingredientList) {
        this.ingredientList = ingredientList;
    }

    /*
    * @return the cuisine type
    */ 
    public String getCuisine() {
        return cuisine;
    }

    /*
     * change the cuisine type of recipe
     * @param cuisine
     */    
    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    /*
    * @return the preparation time of recipe
    */ 
    public double getPrep_time() {
        return prep_time;
    }

    /*
     * change the preparation time of recipe
     * @param prep_time
     */       
    public void setPrep_time(double prep_time) {
        this.prep_time = prep_time;
    }
    
    /*
    * @return the diet type of recipe
    */ 
    public String getDiet() {
        return diet;
    }

    /*
     * change the diet type of recipe
     * @param diet
     */       
    public void setDiets(String diet) {
        this.diet = diet;
    }
    
    /*
    * @return the cooking type of recipe
    */ 
    public String getCookingType() {
        return cookingType;
    }

    /*
    * @return the rating of recipes
    */ 
    public int getRating() {
        return rating;
    }
    
    /*
     * change the rating of recipe
     * @param rating
     */    
    public void setRating(int rating) {
        this.rating = rating;
    }

    /*
     * change the cooking type of recipe
     * @param cookingtype
     */       
    public void setCookingType(String cookingType) {
        this.cookingType = cookingType;
    }
    
    /*
    * @return the list of allergies for recipe
    */ 
    public ArrayList<String> getAllergies() {
        return allergies;
    }

    /*
     * change the allergies of recipe
     * @param allergies name
     */       
    public void setAllergies(ArrayList<String> allergies) {
        this.allergies = allergies;
    }

    public void setDiet(String diet) {
        this.diet = diet;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    /*
    * @return the image directory of recipe
    */ 
    public String getImagePath() {
        return imagePath;
    }
     /*
     * @return the string representation of the recipe object
     */
    @Override
    public String toString() {
        return "recipe{" + "recipe_id=" + recipe_id + ", recipe_name=" + recipe_name + 
                ", ingredientList=" + ingredientList + ", cuisine=" + cuisine + 
                ", prep_time=" + prep_time + ", diets=" + diet + ", cookingType=" + cookingType + 
                ", allergies=" + allergies + '}';
    }
    
    
    
}
