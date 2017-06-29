class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :barcode
      t.text :description
      t.decimal :price
      t.decimal :sale_price
      t.integer :quantity
      t.references :category, foreign_key: true, index: true

      t.timestamps
    end
  end
end
