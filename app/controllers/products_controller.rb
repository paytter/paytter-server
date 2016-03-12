class ProductsController < ApplicationController
  def search
    # TODO: 決め打ちをなおす
    @product = Product.find 1
    @product_type = 'food'

    render 'search', :formats => [:json], :handlers => [:jbuilder]
  end
end
