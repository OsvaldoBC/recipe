require 'rails_helper'

RSpec.describe 'Recipes Index', type: :feature do
  let(:user) { User.create!(name: 'User', email: 'test@test.com', password: 'password') }
  before(:each) do
    user.save!
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    @recipe = Recipe.create(name: 'Test Recipe', preparation_time: 10, cooking_time: 30,
                            description: 'Test Description', public: true, user:)

    visit recipes_path
  end

  describe 'GET /recipes' do
    it 'has the recipes name' do
      expect(page).to have_content(@recipe.name)
    end

    it 'has the recipes description' do
      expect(page).to have_content(@recipe.description)
    end

    it 'has the correct button' do
      expect(page).to have_button('Remove')
    end
  end
end
