class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to items_path(search_id: @search.id)
  end

  def show
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:search).permit(:keywords, :category_id, :min_price, :max_price)
  end
end
