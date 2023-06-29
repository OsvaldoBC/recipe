require 'rails_helper'

RSpec.describe 'Add new food', type: :feature do
  before do
    @user = User.create(name: 'User', email: 'test@test.com', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    @current_user = @user
    
    visit new_food_path
  end

  describe 'GET /foods/new' do
    it 'has the correct title' do
      expect(page).to have_content('Add new food')
    end

    it 'has the correct fields' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Measurement unit')
      expect(page).to have_field('Price')
      expect(page).to have_field('Quantity')
    end

    it 'has the correct buttons' do
      expect(page).to have_button('Create Food')
    end
  end
end
