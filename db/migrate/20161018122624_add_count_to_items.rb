class AddCountToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :count, :integer
  end
end
