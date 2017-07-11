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

#   def update
#   if @ticket.update ticket_params
#     flash[:notice] = 'Ticket updated.'
#   else
#     flash[:notice] = 'Unable to updated ticket.'
#   end
#   # @properties = Property.where(user: current_user)
#   @ticket_id = params[:id]
#   respond_to do |format|
#     format.html { redirect_to root_path }
#     format.js { render }
#   end
# end

  def create
    @review = Review.new(review_params)
    store = Store.find(params[:store_id])
    item = Item.find(params[:item_id])
    @storeItem = StoreItem.where(item_id: item.id, store_id: store.id).first
    @review.store_item = @storeItem
    @review.user = current_user

    if @review.save
       flash_message :notice, "Review Created"
    else
      flash_message :alert, "Problem creating review"
    end
    respond_to do |format|
      format.html { redirect_to store_item_path(store, item) }
      format.js { render }
    end
  end

  # def create
  #   @review = Review.new(review_params)
  #   store = Store.find(params[:store_id])
  #   item = Item.find(params[:item_id])
  #   @storeItem = StoreItem.where(item_id: item.id, store_id: store.id).first
  #   @review.store_item = @storeItem
  #   @review.user = current_user
  #
  #   if @review.save
  #      flash[:notice] = "Review Created"
  #      redirect_to store_item_path(store, item)
  #   else
  #     flash[:alert] = "Problem creating review"
  #     redirect_to store_item_path(store, item)
  #   end
  # end

  # def update
  # end

  def destroy
    @review = Review.find(params[:id])
    @storeItem= StoreItem.find(params[:id])
    store = Store.find(params[:store_id])
    item = Item.find(params[:item_id])

    if current_user == @review.user
      @review.destroy
      flash_message :notice, 'Review Deleted!'
    else
      flash_message :alert, 'Sorry! You can not delete a review, that is not yours'
    end
    
    respond_to do |format|
      format.html { redirect_to store_item_path(store, item) }
      format.js { render }
    end
  end

  # def destroy
  #   @review = Review.find(params[:id])
  #   @storeItem= StoreItem.find(params[:id])
  #   store = Store.find(params[:store_id])
  #   item = Item.find(params[:item_id])
  #   if current_user == @review.user
  #     @review.destroy
  #     flash[:notice] = 'Review Deleted!'
  #     redirect_to store_item_path(store, item)
  #   else
  #     flash[:alert] = 'Sorry! You can not delete a review, that is not yours'
  #     redirect_to store_item_path(store, item)
  #   end
  # end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
