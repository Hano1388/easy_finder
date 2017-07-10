class ReviewsController < ApplicationController
  # before_action :find_review, only: [:destroy]
  before_action :authenticate_user!

  # def index
  # end
  #
  # def show
  #   # @vote = @review.votes.find_by(user_id: current_user)
  # end

  def edit
  end

  def create
    @review = Review.new(review_params)
    store = Store.find(params[:store_id])
    item = Item.find(params[:item_id])
    @storeItem = StoreItem.where(item_id: item.id, store_id: store.id).first
    @review.store_item = @storeItem
    @review.user = current_user

    if @review.save
       flash[:notice] = "Review Created"
       redirect_to store_item_path(store, item)
    else
      flash[:alert] = "Problem creating review"
      redirect_to store_item_path(store, item)
    end
  end

  # def update
  # end

  def destroy
    @review = Review.find(params[:id])
    @storeItem= StoreItem.find(params[:id])
    store = Store.find(params[:store_id])
    item = Item.find(params[:item_id])
    if current_user == @review.user
      @review.destroy
      flash[:notice] = 'Review Deleted!'
      redirect_to store_item_path(store, item)
    else
      flash[:alert] = 'Sorry! You can not delete a review, that is not yours'
      redirect_to store_item_path(store, item)
    end
  end

  # def hide
  #   @review = Review.find params[:id]
  #   # @review.save
  #   @review.update(hidden: !@review.hidden)
  #   redirect_to @review.storeItem
  # end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
