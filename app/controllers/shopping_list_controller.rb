class ShoppingListController < ApplicationController
  include ShoppingListHelper
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @foods = Food.where(user_id: current_user.id)

    @required_foods = @recipes.flat_map do |recipe|
      recipe.recipe_foods.includes(:food).map do |recipe_food|
        food = recipe_food.food
        food[:quantity] = recipe_food.quantity
        food
      end
    end

    stock_hash =
      @foods.to_h do |food|
        [food.name, food.quantity]
      end
    @missing_foods = diff_in_stock(stock_hash, @required_foods)

    @combined_foods = combine_foods(@missing_foods)

    @total_price = helpers.calculate_total_price(@combined_foods)
  end
end
