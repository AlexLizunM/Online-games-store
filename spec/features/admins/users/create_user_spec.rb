# frozen_string_literal: true

require 'rails_helper'

# Feature: Create User
#   As an admin
#   I want to create user
feature 'Create User', type: :feature do
  let!(:admin) { AdminUser.create!(email: 'admin@example.com', password: 'password') }
  let(:last_user) { User.last }
  
  before do
    login_as(admin)
    visit admin_users_path
  end

  # Scenario: Admin create user successfully
  #   Given I am signed in admin
  #   When I click on a new user, fill in forms and save it
  #   Then I create a new user
  scenario 'Admin create a new user successfully', js: true do
    click_link 'New User'
    fill_in('user_nickname', with: 'Duke Nenukem')
    fill_in('user_email', with: 'pios@gmail.com')
    page.attach_file('user_avatar', 'db/picture_for_seed/duke.jpg')
    expect { click_button 'Create User' }.to change { User.count }.by(1)
    expect(last_user.nickname).to eq('Duke Nenukem')
    expect(last_user.email).to eq('pios@gmail.com')
    expect(last_user.avatar.attached?).to be true
  end
end
