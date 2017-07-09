class AddCidToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :cid, :string
  end
end
