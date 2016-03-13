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

  def upload
    user = User.find 1
    user.image = params[:image]

    user.save!

    render json: { user_name: user.user_name, image_url: user.image.url }
  end

  private

  def create_params
    params.require(:user).permit(
      :user_id, :user_name, :post_code, :address, :phone_number, :email, :image,
      my_accounts: [:account_id, :branch_number, :account_type_cd, :account_type,
                    :account_number, :account_holder_type_cd, :account_holder_type,
                    :balance, :opening_date]
    )
  end
end

