class ShirtsController < ApplicationController
  def index
    @shirts = Shirt.all
  end

  def search
    query = params[:q]
    # Shirt.where('name LIKE %query%')
    # @shirts = Shirt.where('name LIKE ?', "%#{query}%")
    @shirts = Shirt.search_for(query)
    # @shirts = Shirt.where(name: query)
  end
end
