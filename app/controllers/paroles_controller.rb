# frozen_string_literal: true

class ParolesController < ProfileLayoutController
  
  def show
    find_user
  end

  def update
    find_user

    unless @user.valid_password?(params[:user][:old_parole])
      flash.now[:alert] = "Error: current password invalid"
      render 'show'
      return
    end
    if @user.update(password_params)
      sign_in(@user)
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Error: #{@user.errors.full_messages.join(', ')}"
      render 'show'
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
