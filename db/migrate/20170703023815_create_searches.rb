class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :category
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
end
