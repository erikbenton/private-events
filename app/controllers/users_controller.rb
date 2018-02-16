class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash.now[:success] = "New user created"
  		redirect_to root_url
  	else
			flash.now[:danger] = "Unable to create user"
			render 'new'
  	end
  end

  def show
    @user = User.find_by(id: current_user.id) if logged_in?
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
