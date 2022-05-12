class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Produto cadastrado com sucesso."
    else
      flash.now[:alert] = 'Houve um erro. O produto não foi cadastrado.'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :code, :manufacturer_id, :weight_in_grams,
                                    :height_in_cm, :width_in_cm, :length_in_cm)
  end
end