class ProductsController < ApiController
	before_action :check_product, only:[:update, :destroy]
	# before_action :check_render, only:[:current_user_products, :index]
	# load_and_authorize_resource 

	def create
		product = Product.new(products_params)
		product.alphanumeric_id = generate_alphanumeric(params[:name])
		if product.save 
			product.available!
		  render json: product, status: :created
 		else
			render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		@product.update(products_params)
		render json: { message:'Update Sucessfully.. ', product:@product }, status: :ok
	end

  def destroy	
		@product.destroy
		render json: { product: @product, message: 'Delete Sucessfully' }, status: :ok
  end
 
	def index
		@products =  if params[:name].present?		 
									Product.available.where("name like ?","%#{params[:name]}%")
						    elsif params[:category_name].present?
					  	  	Product.joins(:category).available.merge(Category.where("category_name like ?","%#{params[:category_name]}%"))
						    else
						    	Product.available
								end	
		if @products.present?
			render json: @products, status: :ok 
		else
			render json: {message:"No Product available"}, status: :not_found
		end
	end

	def show
		# product = Product.available.find_by("name like ?","%#{params[:name]}%")
		 product = Product.available.find_by(id:params[:id])
		 	render json: product, status: :ok
	end

	def current_user_products
		products = @current_user.products.available
		if products.present?
			render json: products, status: :ok
		else
			render json: {message:"No Product available"},status: :not_found
		end
	end

	private

	def products_params
		params.permit(:name, :price, :description, :category_id, :user_id, :product_image)
	end

	def generate_alphanumeric(value)
		random_num = rand(1000)
	 	data = value + "#{random_num}"
	 	return data
	end
	
	# def check_render
	# 	byebug
	# end

	def check_product
		# byebug
	 # @product = @current_user.products.available.find_by(id:params[:id])
	 @product = Product.find_by(id:params[:id])
	end
	
end
