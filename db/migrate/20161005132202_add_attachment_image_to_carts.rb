class AddAttachmentImageToCarts < ActiveRecord::Migration
  def self.up
    change_table :carts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :carts, :image
  end
end
