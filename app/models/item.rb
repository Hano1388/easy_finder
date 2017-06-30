class Item < ApplicationRecord
  belongs_to :category

  belongs_to :shelf, optional: :true

  has_many :storeItems, dependent: :nullify
  has_many :stores, through: :storeItems

end
