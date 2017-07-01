class StaticController < ApplicationController
	def home
		@user = current_user
		render 'static/home'
	end
end
