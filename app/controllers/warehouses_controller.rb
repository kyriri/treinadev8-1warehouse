class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @new_warehouse = Warehouse.new
  end

  def create
    @new_warehouse = Warehouse.new(warehouse_params)
    if @new_warehouse.save
      # flash[:notice] = "Galpão #{Warehouse.last.code} salvo com sucesso"
      redirect_to new_warehouse_path, notice: "Galpão #{Warehouse.last.code} salvo com sucesso"
    else
      flash.now[:alert] = 'Houve um problema. O galpão não foi salvo.'
      render :new
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :description,:area,
                                      :directions, :city, :state, :cep)
  end
end