class Shelf < ApplicationRecord
  belongs_to :row

  has_many :shelfItems, dependent: :nullify
  has_many :items, through: :shelfItems

end
