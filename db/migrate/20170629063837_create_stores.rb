class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :city
      t.string :street_address
      t.string :province
      t.string :postal_code
      t.string :address
      t.float  :longitude
      t.float  :latitude

      t.timestamps
    end
  end
end
