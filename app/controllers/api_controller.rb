class ApiController < ActionController::Base
	include JsonWebToken
 before_action :authenticate_request 


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