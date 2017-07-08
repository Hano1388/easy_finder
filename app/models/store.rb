class Store < ApplicationRecord
  has_many :aisles, dependent: :destroy
  has_many :shelves, dependent: :destroy
  has_many :searches

  has_many :storeItems, dependent: :nullify
  has_many :items, through: :storeItems

  def full_address
    "#{street_address}, #{city}, #{province.capitalize} #{postal_code}"
  end
end
