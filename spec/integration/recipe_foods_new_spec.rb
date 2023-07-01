require 'rails_helper'

RSpec.describe 'Recipes Food New', type: :feature do
  before do
    @user = User.create(name: 'User', email: 'test@test.com', password: 'password')
    @recipe = Recipe.create(name: 'Test Recipe', preparation_time: 10, cooking_time: 30,
                            description: 'Test Description', public: true, user: @user)
    @food = Food.create(name: 'Test Food', user: @user, measurement_unit: 'grams', price: 2, quantity: 5)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit recipe_food_new_path(@recipe)
  end

  describe 'GET /recipe_food/new/:id' do
    it 'Has the correct title' do
      expect(page).to have_content('Add ingredients')
    end

    it 'Has the correct elements' do
      expect(page).to have_content('Select food item')
    end

    it 'Has the quantity field' do
      expect(page).to have_field('Quantity')
    end

    it 'Has the correct button' do
      expect(page).to have_button('Create Recipe food')
    end
  end
end
