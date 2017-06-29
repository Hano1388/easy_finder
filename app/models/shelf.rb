class Shelf < ApplicationRecord
  belongs_to :row

  has_many :items
  
end
