class PlacementsController < ApplicationController
  before_action :set_placement, only: [:show]
  before_action :correct_user, only: [:create]  
  # GET /products
  def index
    @placements = Placement.all
    render json: { data: @placements, code: 200 }
  end

  # GET /products/1
  def show
    render json: { data: @placement, code: 200 }
  end

  # POST /products
  def create
    @placement = Placement.new(placement_params)
    @placement.user_id = current_user.id
    @product = Product.find_by(id: @placement.product_id) 
    
    if @placement.save
      render json: { data: [@placement, @product], code: 200 }, status: :created, location: @placement
    else
      render json: { data: @placement.errors, code: 422 }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_placement
      @placement = Placement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def placement_params
      params.permit(:product_id, :quantity, :add)
    end

    def correct_user
      @user = User.find(params[:user_id])
      render json: { data: "Not Authorized", code: 401 }, status: 401 unless current_user == @user 
    end
end