class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:tradename)
  end
end