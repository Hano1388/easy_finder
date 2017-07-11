class ItemsController < ApplicationController


  def index
    # @items = Item.all.where(["name ILIKE ?", "%#{params[:search]}%"])
    @search = Search.new
    # @newsearch = Search.new
    if params[:search_id]
      @search = Search.find(params[:search_id])
      @items = @search.items
    else
      @items = Item.all.search(params[:search]).limit(10)
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    item_params = params.require(:item).permit([:image])
    @item.update item_params
    redirect_to root_path
  end

  def show
    @review = Review.new

    @item = Item.find(params['id'])
    @itemsShelf = Item.find(params['id']).shelves.find_by_store_id(params['store_id'])
    @store = Store.find(params['store_id'])

    # Bellow line is to show reviews related to an item for a specific store
    @reviews = StoreItem.where(store_id: @store.id, item_id: @item.id).first.reviews.order(created_at: :DESC)

    @hash = Gmaps4rails.build_markers(@store) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
      marker.infowindow store.name
    end
  end


  # private
  # def item_params
  #   params.require(:item).permit(:name, :description, :sale_price, :category_id, :image,)
  # end

end
