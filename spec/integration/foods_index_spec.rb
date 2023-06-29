require 'rails_helper'

RSpec.describe 'Foods Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'User', email: 'test@test.com', password: 'password',
    password_confirmation: 'password')
    @food = Food.create(name: 'apple', price: 2, quantity: 1, measurement_unit: 'grams', user: @user)
    
    @user.save!
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit foods_path
  end

  describe 'GET /foods' do
    it 'has the foods names' do
      expect(page).to have_content('apple')
    end

    it 'has the foods measurement_unit' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'has the correct number of foods' do
      expect(page).to have_selector('.table-food', count: 1)
    end
  end
end
