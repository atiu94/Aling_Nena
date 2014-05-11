require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

#CLIENT SECTION

get '/about' do
	erb :about
end

get '/' do
	@products = Item.all
	@display_products = @products.sample(10)
	erb :index
end

get '/order/:id' do
	id = params[:id]
	@products = Item.find(params[:id])

	erb :order_specific
end

get '/products' do
	@products = Item.all
	erb :products
end

get '/order/result/:id' do
	@products = Item.find(params[:id])
	@products_quantity = params[:choice].to_i
	@products_total = @products.price.to_i * @products_quantity.to_i
	
	@products.update_attributes!(
    quantity: (@products.quantity - params[:select_quantity].to_i),
    sold: (@products.sold + params[:select_quantity].to_i)
    )
	
	erb :order_result
end

#CLIENT SECTION
#ADMIN SECTION

get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
  Item.create!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
    sold: 0
  )
  redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION