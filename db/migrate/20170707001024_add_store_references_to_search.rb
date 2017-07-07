class AddStoreReferencesToSearch < ActiveRecord::Migration[5.1]
  def change
    add_reference :searches, :store, foreign_key: true, index: true
  end
end
