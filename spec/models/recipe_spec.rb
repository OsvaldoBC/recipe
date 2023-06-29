require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.create(name: 'User', email: 'test@test.com')
  subject { Recipe.new(
    name: 'Recipe', 
    preparation_time: 5, 
    cooking_time: 30, 
    description: 'Recipe Description',
    public: true, 
    user: user
    ) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with a preparation time' do
    subject.preparation_time = 5
    expect(subject).to be_valid
  end

  it 'is not valid without a cooking time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
