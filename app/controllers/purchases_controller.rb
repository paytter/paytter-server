class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.save_with_purchase_informations(create_params.merge(
      user_id: access_user.id))
    if @purchase.errors.blank?
      render json: @purchase, status: :created
    else
      render json: { errors: @purchase.errors.full_messages }, status: :bad_request
    end
  end

  private

  def create_params
    params.require(:purchase).permit(
      :store_id, :total_amounts, purchase_informations: [:product_id, :number_of_products])
  end
end
