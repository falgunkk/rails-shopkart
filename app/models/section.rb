# for sections like samsung,nokia etc.
class Section < ApplicationRecord
  has_many:item
  belongs_to:subcategory
end
