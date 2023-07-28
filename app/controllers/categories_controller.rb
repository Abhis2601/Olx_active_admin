class CategoriesController < ApiController
	def index 
		categories = Category.all
		render json: categories, status: :ok
	end

	def category_wise
		categories = Product.available.group(:category_id)
		render json: categories, status: :ok 
	end
end
