class CreateStoreItems < ActiveRecord::Migration[5.1]
  def change
    create_table :store_items do |t|
      t.references :store, foreign_key: true, index: true
      t.references :item, foreign_key: true, index: true

      t.timestamps
    end
  end
end
