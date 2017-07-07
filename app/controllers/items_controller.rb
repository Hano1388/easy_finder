class ItemsController < ApplicationController

  def index
    # @items = Item.all.where(["name ILIKE ?", "%#{params[:search]}%"])
    @search = Search.new
    if params[:search_id]
      search = Search.find(params[:search_id])
      @items = search.items
    else
      @items = Item.all.search(params[:search])
    end
  end

  def store
    @item_shelves = Item.find(params['item_id']).shelves.find_by_store_id(params['store_id'])
    @store = @item_shelves.store
    # =========================Search

  end


  def item_params
    params.require(:item).permit(:name, :description, :sale_price, :category_id)
  end

end
