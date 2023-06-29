require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'User', email: 'test@test.com') }
  subject do
    Food.new(
      name: 'Apple',
      measurement_unit: 'grams',
      price: 1,
      quantity: 10,
      user:
    )
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be as input' do
    subject.name = 'Apple'
    expect(subject).to be_valid
  end

  it 'measurement unit should be as input' do
    subject.measurement_unit = 'grams'
    expect(subject).to be_valid
  end

  it 'price and quantity should be as input and numbers' do
    subject.price = 1
    subject.quantity = 10
    expect(subject).to be_valid
  end
end
