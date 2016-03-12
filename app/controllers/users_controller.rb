class UsersController < ApplicationController

  skip_before_action :authorized_access_token!

  def create
    @user = User.save_with_bank_accounts(create_params)
    if @user.errors.blank?
      render json: { access_token: @user.access_token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def create_params
    params.require(:user).permit(
      :user_id, :user_name, :post_code, :address, :phone_number, :email, :image,
      my_accounts: []
    )
  end
end

