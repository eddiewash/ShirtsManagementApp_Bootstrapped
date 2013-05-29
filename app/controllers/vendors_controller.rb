class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    vendor_params = params.require(:vendor).permit(:name, :website)
    @vendor = Vendor.new vendor_params
    if @vendor.save
      redirect_to @vendor, notice: "Vendor #{@vendor.name} added to the site"
    else
      render 'new'
    end
  end

  def show
    @vendor = Vendor.find params[:id]
    @shirts = @vendor.shirts
  end
end
