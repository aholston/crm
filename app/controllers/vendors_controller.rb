class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    @clients = Client.all
    @houses = House.all
  end
end
