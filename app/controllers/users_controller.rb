class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash.now[:success] = "New user created"
  		render 'show'
  	else
			flash.now[:danger] = "Unable to create user"
			render 'new'
  	end
  end

  def show
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end