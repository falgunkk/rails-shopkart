# for subcategories like mobile,computer etc.
class Subcategory < ApplicationRecord
  has_many:section
  belongs_to:category
end
