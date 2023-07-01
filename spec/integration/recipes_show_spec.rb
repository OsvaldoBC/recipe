require 'rails_helper'

RSpec.describe 'Recipes Show', type: :feature do
  before do
    @user = User.create(name: 'User', email: 'test@test.com', password: 'password')
    @recipe = Recipe.create(name: 'Test Recipe', preparation_time: 10, cooking_time: 30,
                            description: 'Test Description', public: true, user: @user)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit recipes_show_path(@recipe)
  end

  describe 'GET /recipe/:id' do
    it 'has the recipe name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'has the recipe description' do
      expect(page).to have_content(@recipe.description)
    end

    it 'has the recipe preparation time' do
      expect(page).to have_content('10')
    end

    it 'has the recipe cooking time' do
      expect(page).to have_content('30')
    end
  end
end
