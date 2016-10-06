class AddColumnsToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :name, :string
    add_column :carts, :description, :text
  end
end
