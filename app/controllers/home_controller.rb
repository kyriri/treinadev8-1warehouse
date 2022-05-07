class HomeController < ApplicationController
  def index
    @warehouses = Warehouse.all # TODO .order(area: :desc)
  end
end