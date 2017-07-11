class StoreItem < ApplicationRecord
  belongs_to :store
  belongs_to :item

  has_many :reviews, dependent: :destroy
end
