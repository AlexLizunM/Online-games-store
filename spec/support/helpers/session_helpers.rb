# frozen_string_literal: true
module Features
  module SessionHelpers
    def signin_admin(email, password)
      visit admin_root_path
      fill_in 'admin_user_email', with: email
      fill_in 'admin_user_password', with: password
      click_button 'Login'
    end

    def signin_user(email, password)
      visit new_user_session_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Log in'
    end

    def signup_visitor(nickname, email, password)
      visit new_user_registration_path
      fill_in 'user_nickname', with: nickname
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign up'
    end
  end
end
