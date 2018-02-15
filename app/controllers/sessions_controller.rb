class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])
  	if @user
  		log_in @user
  		redirect_to @user
  	else
  		flash[:danger] = "Invalid email/password"
  		render 'new'
  	end
  end

  def destroy
  	logout if logged_in?
  end
end
