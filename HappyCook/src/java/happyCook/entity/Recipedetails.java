/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package happyCook.entity;

/**
 *
 * @author pyaephyo
 */
public class Recipedetails {
    private int recipe_id;
    private String instructions;
    private String nutritutions;

    /*
    * constructor
    * @param recipe_id
    * @param instructions
    * @param nutritution facts
    */
    public Recipedetails(int recipe_id, String instructions, String nutritutions) {
        this.recipe_id = recipe_id;
        this.instructions = instructions;
        this.nutritutions = nutritutions;
    }

    /*
     * @return the ingredient id
     */     
    public int getRecipe_id() {
        return recipe_id;
    }
    
    /*
     * change the recipe_id of recipedetails
     * @param recipe_id
     */
    public void setRecipe_id(int recipe_id) {
        this.recipe_id = recipe_id;
    }

    /*
     * @return the instructions for recipe
     */     
    public String getInstructions() {
        return instructions;
    }
    
    /*
     * change the instrcutions of recipe
     * @param instructions
     */
    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }
    
    /*
     * @return the nutruitution facts
     */ 
    public String getNutritutions() {
        return nutritutions;
    }
    
    /*
     * change the nutritution facts of recipe
     * @param nutritution
     */
    public void setNutritutions(String nutritutions) {
        this.nutritutions = nutritutions;
    }
    
    
}
