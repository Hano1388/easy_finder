class Aisle < ApplicationRecord
  belongs_to :store
  has_many :rows, dependent: :destroy
end
