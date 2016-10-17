class AddEnddateToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :enddate, :datetime
  end
end
