class RestaurantsController < ApplicationController

	# removes the need to have authenticate user before every every action
	# before_action: authenticate_user!, except: [:index]

	def index
		@restaurants = Restaurant.all
		@review = Review.new
	end

	def new
		# authenticate_user!
		@restaurant = Restaurant.new
	end

	def create
		# authenticate_user!
		@restaurant = Restaurant.new(params['restaurant'].permit(:name, :address, :cuisine))
		if @restaurant.save
			redirect_to '/restaurants'
		else
			render 'new'
		end
	end

	def edit
		# authenticate_user!
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		# authenticate_user!
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update(params['restaurant'].permit(:name, :address, :cuisine))
			redirect_to '/restaurants'
		else
			render 'new'
		end
	end

	def destroy
		# authenticate_user!
		@restaurant = Restaurant.find(params[:id])
		@restaurant.delete
		flash[:notice] = "Restaurant DESTROYED"
		redirect_to '/restaurants'
	end


end
