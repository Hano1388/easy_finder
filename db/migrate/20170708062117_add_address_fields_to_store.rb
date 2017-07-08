class AddAddressFieldsToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :city, :string
    add_column :stores, :street_address, :string
    add_column :stores, :province, :string
    add_column :stores, :postal_code, :string
    add_column :stores, :longitude, :string
    add_column :stores, :latitude, :string
    remove_column :stores, :location, :string
  end
end
