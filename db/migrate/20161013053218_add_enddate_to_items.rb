class AddEnddateToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :enddate, :DATETIME
  end
end
