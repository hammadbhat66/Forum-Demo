class ApplicationController < ActionController::Base
	before_action :devise_permitted_parameters

	def devise_permitted_parameters
		
	end
end
