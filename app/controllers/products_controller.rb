class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: { data: @products, code: 200 }
  end

  # GET /products/1
  def show
    render json: { data: @product, code: 200 }
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    
    if @product.save
      render json: { data: @product, code: 200 }, status: :created, location: @product
    else
      render json: { data: @product.errors, code: 422 }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: { data: @product, code: 200 }
    else
      render json: { data: @product.errors, code: 422 }, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    render json: { data: "Record deleted", code: 200 }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :price, :quantity)
    end
end
