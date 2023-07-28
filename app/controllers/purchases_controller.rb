class PurchasesController < ApiController
	before_action :check_render, only: [:index, :current_user_sold_products]
	load_and_authorize_resource 

	def create
		product = Product.available.find_by(id:params[:id]).accessible_by(current_ability)
		purchase = @current_user.purchases.new(product_id: product.id)
	 	purchase.save
		product.sold!
		render json: purchase, status: :created
	end

	def index
		@purchases = if params[:id].present?
									 Purchase.find_by(product_id: params[:id]).accessible_by(current_ability)
								else
									@current_user.purchases
								end
	end

	def current_user_sold_products
		@purchases = @current_user.products.sold 
	end

	def mail_send
		byebug
			@email = params[:email]
		UserMailer.with(email:@email).welcome_email.deliver_now
		render json:{message:"Mail sent sucessfully...."}
	end
	
	private

	def check_render
		if @purchases.present?
			render json: @purchases, status: :ok
		else
			render json: {message:"NO PURCHASE"}, status: :not_found
		end
	end
end
