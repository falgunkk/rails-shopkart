# for categories like mobiles, computers, books etc.
class Category < ApplicationRecord
  has_many:subcategories
end

