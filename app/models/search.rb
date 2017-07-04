class Search < ApplicationRecord

  def items
    @items ||= find_items
  end

  private

  def find_items
    items = Item.order(:name)
    items = items.where("name ILIKE ?", "%#{keywords}") if keywords.present?
    items = items.where(category_id: category_id) if category_id.present?
    items = items.where("price >= ?", min_price) if min_price.present?
    items = items.where("price <= ?", max_price) if max_price.present?
    items
  end
end
