# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'profile'

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
		if @user.update(user_params)
    	redirect_to user_path(@user)
  	else
    	render 'edit'
  	end
  end

  def user_params
		params.require(:user).permit(:nickname, :email, :avatar)
	end
end
