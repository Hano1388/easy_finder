class Item < ApplicationRecord
  belongs_to :category

  belongs_to :shelf

  has_many :storeItems, dependent: :nullify
  has_many :stores, through: :storeItems

end
