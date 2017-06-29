class RemoveFieldBarcodeFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :barcode, :integer
  end
end
