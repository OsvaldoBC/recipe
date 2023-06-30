class RecipeFoodController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> dcb4d96 (add delete recipe from food)
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipes_show_path(@recipe_food.recipe_id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
      @recipe_food = RecipeFood.find(params[:id])
      @recipe = Recipe.find(@recipe_food.recipe_id)
      @food = Food.find(@recipe_food.food_id)
      @recipe_food.update(recipe_food_params)
      redirect_to recipes_show_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipes_show_path(@recipe_food.recipe_id)
  end
  
  private

  def recipe_food_params  
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
<<<<<<< HEAD
=======
>>>>>>> ebab076 (Add create recipes form and display food table for recipe)
=======
>>>>>>> dcb4d96 (add delete recipe from food)
end
