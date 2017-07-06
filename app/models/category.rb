class Category < ApplicationRecord
  has_many :items, dependent: :nullify
  has_many :searches
end
