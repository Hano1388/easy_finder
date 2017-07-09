class Store < ApplicationRecord
  has_many :aisles, dependent: :destroy
  has_many :shelves, dependent: :destroy
  has_many :searches

  has_many :storeItems, dependent: :nullify
  has_many :items, through: :storeItems

  # validates :province
  #
  # before_save :uppercase_province
  #
  # def uppercase_province
  #   province.upcase!
  # end

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{name} #{street_address}, #{city}, #{province.upcase} #{postal_code} Canada"
  end
end
