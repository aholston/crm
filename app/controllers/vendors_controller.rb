class VendorsController < ApplicationController

  def index
    @vendors = Vendor.search(params[:search]).order(:company).page(params[:page]).per(15)
  end

  def create
    vendor = Vendor.create(vendor_val)
    if !vendor.errors.full_messages.empty?
      flash[:errors] = client.errors.full_messages
    end
    return redirect_to '/vendors'
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update(vendor_val)
    return redirect_to '/vendors'
  end

  def destroy
    vendor = Vendor.find(params[:id])
    vendor.destroy
    redirect_to '/vendors'
  end
end
