class ShirtsController < ApplicationController
  before_action :set_shirt, only: [:edit, :show, :update]

  def index
    @shirts = Shirt.all
  end

  def new
    @shirt = Shirt.new
    @vendors = Vendor.all
  end

  def create
    @shirt = Shirt.new(shirt_params)
    if @shirt.save
      redirect_to @shirt
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @shirt.update shirt_params
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
  end

  private

  def shirt_params
    params.require('shirt').permit(:name, :description, :image, :vendor_id)
  end

  def set_shirt
    @shirt = Shirt.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.now[:notice] = "Invalid Shirt ID #{params[:id]}"
    redirect_to root_path
  end
end









