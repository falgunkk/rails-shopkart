class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :price
      t.string :DECIMAL10
      t.string :DECIMAL2
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
