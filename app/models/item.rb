# for each individual items inside the subcategiries.
class Item < ApplicationRecord
  belongs_to :subcategory
end
