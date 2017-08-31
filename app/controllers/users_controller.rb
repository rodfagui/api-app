class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :correct_user, only: [:show, :update, :destroy]
  before_action :admin_user, only: [:index, :create]
    
  # GET /products
  def index
    @users = User.all

    render json: { data: @users, code: 200 }
  end

  # GET /products/1
  def show
    render json: { data: @user, code: 200 }
  end

  # POST /products
  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: { data: @user, code: 200 }, status: :created, location: @user
    else
      render json: { data: @user.errors, code: 422 }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @user.update(user_params)
      render json: { data: @user, code: 200 }
    else
      render json: { data: @user.errors, code: 422 }, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @user.destroy
    render json: { data: "Record deleted", code: 200 }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:username, :email, :password, :password_confirmation, :admin)
    end
    
    def admin_user
      render json: { data: "Not Authorized", code: 401 }, status: 401 unless current_user.admin
    end

    def correct_user
      @user = User.find(params[:id])
      render json: { data: "Not Authorized", code: 401 }, status: 401 unless current_user == @user || current_user.admin 
    end  
end