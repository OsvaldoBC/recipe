class RecipesController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session
    else
      @user = current_user
      @recipes = @user.recipes
    end
  end

  def public
    @recipes = Recipe.filter_by(public)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new user: current_user, name: params[:name], preparation_time: params[:preparation_time],
                         cooking_time: params[:cooking_time], description: params[:description], public: false
    if @recipe.save
      redirect_to recipe_show_path(@recipe.id)
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = 'Recipe delete'
    redirect_to recipes_path
  end
end
