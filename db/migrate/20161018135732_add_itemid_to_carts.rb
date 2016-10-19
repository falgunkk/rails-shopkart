class AddItemidToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :itemid, :integer
  end
end
