class Shelf < ApplicationRecord
  belongs_to :row
  belongs_to :store

  has_many :shelfItems, dependent: :nullify
  has_many :items, through: :shelfItems

end
