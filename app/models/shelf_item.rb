class ShelfItem < ApplicationRecord
  belongs_to :shelf
  belongs_to :item
end
