class Item < ApplicationRecord
  belongs_to :category

  # belongs_to :shelf, optional: :true

  has_many :storeItems, dependent: :nullify
  has_many :stores, through: :storeItems

  has_many :shelfItems, dependent: :nullify
  has_many :shelves, through: :shelfItems


  def next
    self.class.where("id > ?", id).first
  end

  # def previuos
  #   self.class.where("id < ?", id).last
  # end

  def self.search(search)
    if search
      where(["name ILIKE ?", "%#{search}%"])
    else
      all
    end
  end


end
