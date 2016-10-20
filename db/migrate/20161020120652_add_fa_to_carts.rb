class AddFaToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :fa, :integer
  end
end
