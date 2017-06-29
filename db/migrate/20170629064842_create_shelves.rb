class CreateShelves < ActiveRecord::Migration[5.1]
  def change
    create_table :shelves do |t|
      t.integer :shelf_number
      t.references :row, foreign_key: true, index: true

      t.timestamps
    end
  end
end
