class AddShelfToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :shelf, foreign_key: true, index: true
  end
end
