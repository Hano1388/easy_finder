class CreateShelfItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shelf_items do |t|
      t.references :shelf, foreign_key: true, index: true
      t.references :item, foreign_key: true, index: true

      t.timestamps
    end
  end
end
