class UsersController < ApplicationController

  skip_before_action :authorized_access_token!
  before_action :set_store
  before_action :authenticate_client!, only: :index

  def index
    @users = @store.users
  end

  def create
    @user = User.save_with_bank_accounts(create_params)
    if @user.errors.blank?
      render json: { access_token: @user.access_token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def upload
    access_user.image = params[:image]

    access_user.save!

    render json: { user_name: access_user.user_name, image_url: access_user.image.url }
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

  def set_store
    @store = Store.find(params[:store_id])
  end
end

