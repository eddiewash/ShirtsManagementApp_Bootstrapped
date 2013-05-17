class ShirtsController < ApplicationController
  def index
    @shirts = Shirt.all
  end

  def new
    @shirt = Shirt.new
  end

  def create
    safe_params = params.require('shirt').permit(:name, :description, :image)
    @shirt = Shirt.create(safe_params)
    redirect_to @shirt
  end

  def search
    query = params[:q]
    # Shirt.where('name LIKE %query%')
    # @shirts = Shirt.where('name LIKE ?', "%#{query}%")
    @shirts = Shirt.search_for(query)
    # @shirts = Shirt.where(name: query)
  end

  def show
    @shirt = Shirt.find(params[:id])
  rescue
    redirect_to root_path
  end
end
