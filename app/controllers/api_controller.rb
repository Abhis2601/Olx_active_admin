class ApiController < ActionController::API
	include JsonWebToken
 before_action :authenticate_request 

 # rescue_from CanCan::AccessDenied do |exception|
 # 	render json:{message:exception}
 # end
 
 # def current_user
 # 	@current_user
 # end

 # rescue_from ActiveRecord::RecordNotFound do |exception|
 # 	render json:{message:exception}
 # end

 # rescue_from NoMethodError do |exception|
 # 	render json:{message:exception}
 # end
 
	def authenticate_request
		begin
			header = request.headers["Authorization"]
			header = header.split(" ").last if header
			decoded = jwt_decode(header)
			@current_user = User.find(decoded[:user_id])
		rescue
			render json: { error: "unauthorized user" }, status: :unauthorized
		end
	end
end	