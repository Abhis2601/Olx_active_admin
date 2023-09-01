class UsersController < ApiController
	skip_before_action :authenticate_request, only: [:create, :login] 
	# load_and_authorize_resource 

	def create
	  user = User.new(params_user)
	  if user.save
		 # token =  jwt_encode(user_id: user.id)
		 render json: { user: user }, status: :created
	  else
		 render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
	  end
	end

	def update
		if @current_user.update(params_user).accessible_by(current_ability)
 			render json: {  user:@current_user,message:"Update Sucessfully..." }, status: :created
 		else
 		  render json:{ errors: @current_user.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def index
		users = User.all
		render json: users
	end

	def login
		if params[:email].present?
			user = User.find_by(email:params[:email])
			if user.present? && user.password == params[:password] 
				token = jwt_encode(user_id: user.id)
				render json: { token:token }, status:	:ok
			else
				render json: { error:'unauthorized' }, status: :unauthorized
			end
		else
			render json: { message:"email can't be blank" }, status: :unauthorized
		end
	end

	private

	def params_user
		params.permit(:first_name,:last_name,:mobile_no,:email,:password)
	end

end
