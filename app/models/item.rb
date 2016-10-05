# for each individual items inside the subcategiries.
class Item < ApplicationRecord
  validates :name, presence: true,
             length: { minimum: 4 }
  validates :description, presence: true,
             length: { minimum: 4 }
  validates :price, presence: true,
            format: { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/  }     
  has_attached_file :image,styles:{ medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :subcategory
  #belongs_to :user
end
