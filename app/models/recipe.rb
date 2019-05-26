class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  before_save :erase_empty_ingredients

  def erase_empty_ingredients
    self.ingredients = self.ingredients.select{|ingredient| ingredient.name && ingredient.name != '' ||ingredient.quantity && ingredient.quantity != '' }
  end
end
