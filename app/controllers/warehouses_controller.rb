class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update,]
  
  def show
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      # flash[:notice] = "Galpão #{Warehouse.last.code} salvo com sucesso"
      redirect_to new_warehouse_path, notice: "Galpão #{Warehouse.last.code} salvo com sucesso"
    else
      flash.now[:alert] = 'Houve um problema. O galpão não foi salvo.'
      render :new
    end
  end

  def edit
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse, notice: "Galpão atualizado com sucesso"
    else
      flash.now[:alert] = 'Houve um problema. O galpão não foi salvo.'
      render :edit
    end
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :description,:area,
                                      :directions, :city, :state, :cep)
  end
end