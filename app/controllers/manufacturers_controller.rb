class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:tradename)
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manuf_params)
    if @manufacturer.save
      redirect_to new_manufacturer_path, notice: "Fornecedor #{@manufacturer.tradename} cadastrado com sucesso"
    else
      flash.now[:alert] = 'Houve um erro. O fornecedor não foi cadastrado.'
      render :new
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manuf_params)
      redirect_to @manufacturer, notice: 'Dados atualizados com sucesso'
    else
      flash.now[:alert] = 'Houve um erro. Os dados não foram atualizados.'
      render :edit
    end
  end

  private

  def manuf_params
    params.require(:manufacturer).permit(:tradename, :registered_name, :cnpj,
                                         :email, :address, :telephone)
  end
end