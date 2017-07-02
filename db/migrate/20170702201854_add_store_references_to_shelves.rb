class AddStoreReferencesToShelves < ActiveRecord::Migration[5.1]
  def change
    add_reference :shelves, :store, foreign_key: true, index: true
  end
end
