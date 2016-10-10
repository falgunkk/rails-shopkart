class AddUseridToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :userid, :integer
  end
end
