class Category < ApplicationRecord
  has_many :items, dependent: :nullify
end
