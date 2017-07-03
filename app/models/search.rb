class Search < ApplicationRecord
  def search_items

    items = Item.all

    items = items.where(["name ILIKE ?", "%#{keywords}%"]) if keywords.present?
    items = items.where(["Item.category ILIKE ?", "#{category}"]) if category.present?
    items = items.where(["price >= ?", min_price]) if min_price.present?
    items = items.where(["price <= ?", max_price]) if max_price.present?

    return items
  end
end
