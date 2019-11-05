# frozen_string_literal: true

class UsersController < ProfileLayoutController
  before_action :find_user

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :avatar)
  end
  
  def find_user
    @user = User.find(params[:id])
  end
end
