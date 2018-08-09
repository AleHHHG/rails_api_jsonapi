class UsersController < ApplicationController
	def index
	 	render jsonapi: User.all, include: :products
	end

	def show
		user = User.find(params[:id])
		render jsonapi: user, include: :products
	end

	def create
		@user = User.create(user_params)
		render jsonapi: @user, include: :products, status: :created
	end

	def update
		user = User.find(params[:id])
	 	user.update(user_params)
		render jsonapi: user
	end

	def destroy
	 	User.destroy(params[:id])
		render :no_content
	end

	private

	def user_params
		params.permit(:name, :document)
	end
end
