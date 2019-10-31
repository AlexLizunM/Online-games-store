# frozen_string_literal: true
# Feature: User profile
#   As a user
#   I want to visit my user profile
feature 'User profile', type: :feature do
  let(:user) { create(:user, :confirmed) }

  before do
    signin_user(user.email, user.password)
    click_button 'dropdownMenuButton'
    click_link 'Your profile'
  end
  # Scenario: User profile shown successfully
  #   Given I am signed in
  #   When I click on my profile
  #   Then I see my profile
  scenario 'user profile name shown successfully' do
    expect(page).to have_selector("input[value='Duke Nukem']")
  end

  scenario 'user profile email shown successfully' do
    expect(page).to have_selector("input[value='deusvult@gmail.com']")
  end

  scenario 'choose avatar successfully' do
    page.attach_file('user_avatar', 'db/picture_for_seed/duke.jpg')
    click_button 'Update profile'

    expect(page).to have_css('img')
  end

  scenario 'change password successfully' do
    click_link 'Change password'
    fill_in('user_old_parole', with: 'qwerty')
    fill_in('user_password', with: "asdfgh")
    fill_in('user_password_confirmation', with: "asdfgh")
    click_button 'Change my password'
    
    expect(page).to have_content 'Public profile'
  end

  scenario 'invalid old parole in change password unsuccessfully' do
    click_link 'Change password'
    fill_in('user_old_parole', with: 'as')
    click_button 'Change my password'
    
    expect(page).to have_content 'current password invalid'
  end

  scenario 'new password change password unsuccessfully' do
    click_link 'Change password'
    fill_in('user_old_parole', with: 'qwerty')
    fill_in('user_password', with: "qw")
    fill_in('user_password_confirmation', with: "qw")
    click_button 'Change my password'
    
    expect(page).to have_content 'Password is too short'
  end

  scenario 'new password confirmation in change password unsuccessfully' do
    click_link 'Change password'
    fill_in('user_old_parole', with: 'qwerty')
    fill_in('user_password', with: "asdfgh")
    fill_in('user_password_confirmation', with: "as")
    click_button 'Change my password'
    
    expect(page).to have_content "Password confirmation doesn't match"
  end
end
