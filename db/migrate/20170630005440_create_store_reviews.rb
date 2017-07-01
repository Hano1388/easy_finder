class CreateStoreReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :store_reviews do |t|
      t.text :body
      t.references :store, foreign_key: true, index: true

      t.timestamps
    end
  end
end
