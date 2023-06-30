class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:public]
  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_show_path(@recipe.id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = 'Recipe delete'
    redirect_to recipes_path
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to recipes_show_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
