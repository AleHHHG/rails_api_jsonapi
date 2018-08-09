class ProductsController < ApplicationController
	def index
	 	render jsonapi: Product.all, include: :user
	end

	def show
		render jsonapi: Product.find(params[:id]), include: :user
	end

	def create
		product = Product.create(product_params)
		render jsonapi: product, include: :user, status: :created
	end

	def update
		product = Product.find(params[:id])
	 	product.update(product_params)
		render jsonapi: product
	end

	def destroy
	 	Product.destroy(params[:id])
		render :no_content
	end

	private

	def product_params
		params.permit(:name, :price, :user_id)
	end
end
