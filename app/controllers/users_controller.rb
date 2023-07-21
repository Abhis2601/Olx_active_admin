class UsersController < ApiController
	skip_before_action :authenticate_request ,only: [:create] 
	
	def create
		# byebug
	  user = User.new(params_user)
	  if user.save
		 token =  jwt_encode(user_id: user.id)
		 render json: { user: user, token: token }, status: :created
	  else
		 render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
	  end
	end

	def update
		if @current_user.update(params_user)
 			render json: { user: @current_user, message: "Update Sucessfully..." }, status: :created
 		else
 		  render json:{ errors: @current_user.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def index
		users = User.all
		render json: users
	end

	private

	def params_user
		params.permit(:first_name,:last_name,:mobile_no,:email,:password)
	end

end
