class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to items_path(search_id: @search.id)
  end

  def update
    begin
      @search = Search.find params[:id]
    rescue
        return create
    end

    if @search.update(search_params)
      redirect_to items_path(search_id: @search.id)
    else
      redirect_to items_path
    end
  end


  def show
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:search).permit(:keywords,:store_id, :category_id, :min_price, :max_price)
  end
end
