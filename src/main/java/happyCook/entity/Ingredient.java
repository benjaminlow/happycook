/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package happyCook.entity;

/**
 *
 * @author pyaephyo
 */
public class Ingredient {
    
    //attributes
    private String name;
    private double amount;
    private String measurment;
    private int recipe_id;

    /*
    * constructor
    * @param ingredient_id 
    * @param ingredient name
    * @param recipe_id of which ingredient is attached to
    */
    public Ingredient(String name, double amount, String measurement) {
        this.name = name;
        this.amount = amount;
        this.measurment = measurement;
    }
    
    public Ingredient(String name) {
        this.name = name;
        this.amount = 0;
        this.measurment = "";
    }


    /*
    * @return the ingredient name
    */ 
    public String getIngredient_name() {
        return name;
    }

    /*
     * change the name of ingredient
     * @param ingredient_name
     */
    public void setIngredient_name(String ingredient_name) {
        this.name = ingredient_name;
    }

    /*
    * @return the recipe id
    */ 
    public int getRecipe_id() {
        return recipe_id;
    }

    /*
     * change the recipe id of the ingredient
     * @param recipe_id
     */
    public void setRecipe_id(int recipe_id) {
        this.recipe_id = recipe_id;
    }

    /*
    * @return the string representation of ingredient object
    */ 
    @Override
    public String toString() {
        return "ingredient{" + "ingredient_name=" + name + ", recipe_id=" + recipe_id + '}';
    }
    
    
}
