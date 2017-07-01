class CreateAisles < ActiveRecord::Migration[5.1]
  def change
    create_table :aisles do |t|
      t.integer :aisle_number
      t.references :store, foreign_key: true, index: true

      t.timestamps
    end
  end
end
