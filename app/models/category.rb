# for categories like mobiles, computers, books etc.
class Category < ApplicationRecord
  validates :name, presence: true,
          length: { minimum: 4 }
  has_many:subcategories
end

