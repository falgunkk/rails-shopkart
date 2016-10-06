class AddPriceToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :price, :decimal
  end
end
