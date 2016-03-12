class ShoppingsController < ApplicationController
  def create
    @shopping = Shopping.new(create_params.merge(user_id: access_user.id))
    if @shopping.save
      render json: @shopping, status: :created
    else
      render json: { errors: @shopping.errors.full_messages }, status: :bad_request
    end
  end

  private

  def create_params
    params.require(:shopping).permit(:product_id, :number_of_products, :store_id, :action)
  end
end
