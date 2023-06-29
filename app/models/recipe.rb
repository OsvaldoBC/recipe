class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_and_belongs_to_many :foods, join_table: 'recipe_foods'

  validates :name, presence: true, length: { maximum: 50 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 1000 }

  def price
    Recipe.include(:recipe_foods)
  end
end
