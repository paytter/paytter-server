json.price @price
json.candidates do |candidate|
  json.category @product_type
  json.detail @product.send(@product_type), partial: "#{@product_type}s/#{@product_type}", as: @product_type.to_sym
  json.extract! @product, :itemId, :score, :imageUrl
  json.sites do |site|
    json.url @product.sites_url
    json.imageUrl @product.sites_imageUrl
    json.title @product.sites_title
  end
end
