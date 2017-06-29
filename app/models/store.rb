class Store < ApplicationRecord
  has_many :aisles, dependent: :destroy

  has_many :storeItems, dependent: :nullify
  has_many :items, through: :storeItems
end
