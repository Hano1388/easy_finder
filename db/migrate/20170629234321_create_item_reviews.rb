class CreateItemReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :item_reviews do |t|
      t.text :body

      t.timestamps
    end
  end
end
