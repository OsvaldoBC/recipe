require 'rails_helper'

RSpec.describe 'Recipes New', type: :feature do
  before do
    @user = User.create(name: 'User', email: 'test@test.com', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    visit recipes_create_path
  end

  describe 'GET /recipes/new' do
    it 'has the correct title' do
      expect(page).to have_content('New Recipe')
    end

    it 'has the correct fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
    end

    it 'has the correct button' do
      expect(page).to have_button('Create Recipe')
    end
  end
end
