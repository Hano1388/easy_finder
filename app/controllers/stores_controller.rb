class StoresController < ApplicationController
  before_action :find_store, only: [:show]

  def index
    @stores = Store.all
  end

  # def show
  # end


  private

  def find_store
    @store = Store.find params[:id]
  end

end
