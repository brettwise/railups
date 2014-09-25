class SessionsController < ApplicationController 
	skip_before_filter :verify_authenticity_token

	def new
		redirect_to "/auth/github"
	end

	def create
		@user = User.from_omniauth(auth_hash)
		sign_in @user
		redirect_to root_path, :notice => "Signed in!"
	end

	def destroy
		sign_out
		redirect_to root_url, :notice => "Signed out!"
	end

	private

	def auth_hash
		request.env['omniauth.auth']
	end
end