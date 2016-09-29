# subcategories of main categories like smartphones, laptop, text books etc.
class Subcategory < ApplicationRecord
  belongs_to :category
  has_many:items
end
