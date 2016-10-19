class AddCartdateToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :cartdate, :datetime
  
  end
end
