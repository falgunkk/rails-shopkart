# subcategories of main categories like smartphones, laptop, text books etc.
class Subcategory < ApplicationRecord
  validates :name, presence: true,
          length: { minimum: 4 }
  belongs_to :category
  has_many:items
end
