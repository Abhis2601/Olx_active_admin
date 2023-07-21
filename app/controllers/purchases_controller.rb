class PurchasesController < ApiController
	def create
		products = Product.available.where.not(user_id: @current_user.id)
		product = products.find_by(id:params[:id])
		if products.present? && product.present?
			purchase = @current_user.purchases.new(product_id: product.id)
			if purchase.save
				product.sold!
				render json: purchase, status: :created
			else
				render json: { errors: purchase.errors.full_messages }, status: :unprocessable_entity
			end
		else
			render json: { message:"Product not found" }, status: :not_found
		end
	end

	def index
		if params[:product_id].present?
			purchase = @current_user.purchases.find_by(product_id: params[:product_id])
			check_render(purchase)
		else
			purchases = @current_user.purchases
			check_render(purchases)
		end
	end

	def current_user_sold_products
		products = @current_user.products.sold
		if products.present?
			render json: products, status: :ok 
		else
			render json:{ message:"No Record found" }, status: :not_found
		end
	end

	private

	def check_render(purchase)
		if purchase.present?
			render json: purchase, status: :ok 
		else
			render json: { message:"No purchase" }, status: :not_found
		end
	end
end
