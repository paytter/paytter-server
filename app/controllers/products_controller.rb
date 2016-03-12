class ProductsController < ApplicationController
  before_action :check_params

  def search
    @product = search_product
    render json: { error: { message: 'product not found' } }, status: :not_found and return if @product.nil?

    @product_type = 'food'
    @price = @product.product_stores.select(:price).find_by(store_id: params[:store_id]).price

    render 'search', :formats => [:json], :handlers => [:jbuilder]
  end

  private

  def search_product
    case @meta_product_id
    when 'item_ids' then
      item_ids = params[@meta_product_id].split(',')
      item_ids.map { |item_id| Product.find_by(itemId: item_id) }.compact.first
    when 'isbn_id' then
      if params[@meta_product_id].size == 13
        book = Book.find_by(isbn13: parms[@meta_product_id])
      else
        book = Book.find_by(isbn10: params[@meta_product_id])
      end
      book.product if book.present?
    when 'ean_id' then
      if params[@meta_product_id].size == 13
        food = Food.find_by(ean13: params[@meta_product_id])
      else
        food = Food.find_by(ean8: params[@meta_product_id])
      end
      food.product if food.present?
    end
  end

  def check_params
    @meta_product_id = (%w(item_ids isbn_id ean_id) & params.keys).first
    render json: { error: { message: 'invalid params' } }, status: :bad_request unless valid_params?
  end

  def valid_params?
    params.keys.include?('store_id') && @meta_product_id.present?
  end
end
