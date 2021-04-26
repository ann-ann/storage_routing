json.extract! product, :id, :name, :reference, :category, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
