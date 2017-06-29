class Row < ApplicationRecord
  belongs_to :aisle
  has_many :shelves, dependent: :nullify
end
