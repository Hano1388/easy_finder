class CreateRows < ActiveRecord::Migration[5.1]
  def change
    create_table :rows do |t|
      t.integer :row_number
      t.references :aisle, foreign_key: true, index: true

      t.timestamps
    end
  end
end
