class Review < ApplicationRecord
  belongs_to :user
  belongs_to :store_item

  validates :rating, presence: true, inclusion: {in: 1..5}
end
