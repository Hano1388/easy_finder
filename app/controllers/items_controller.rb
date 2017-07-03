class ItemsController < ApplicationController

  def index
    # @items = Item.all.where(["name ILIKE ?", "%#{params[:search]}%"])
    @items = Item.all.search(params[:search])
  end

  def item_params
    params.require(:item).permit(:name, :description, :sale_price, :category_id)
  end

end
