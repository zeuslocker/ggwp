
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    custom_field_params.each do |field_name, value|
      if @user.custom_field_values[field_name].present?
        @user.custom_field_values[field_name] = value
      else
        render json: { error: "Custom field #{field_name} does not exist" }, status: :unprocessable_entity
        return
      end
    end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :tenant_id, custom_fields: {})
    end

    def custom_field_params
      params.require(:user).permit(custom_field_values: {})
    end
end
