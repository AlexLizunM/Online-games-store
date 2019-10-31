# frozen_string_literal: true
# Feature: Sign in
#   As a user
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', type: :feature do
  let!(:user) { create(:user, :confirmed) }
  # Scenario: User cannot sign in if not registered
  #   Given I do not exist as a user
  #   When I sign in with valid credentials
  #   Then I see an invalid credentials message
  scenario 'user cannot sign in if not registered', js: true do
    signin_user('test@example.com', user.password)
    
    expect(page).to have_content 'Invalid Email or password'
  end

  # Scenario: User can sign in with valid credentials
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with valid credentials
  #   Then I see a success message
  scenario 'user can sign in with valid credentials', js: true do
    signin_user(user.email, user.password)
    click_button 'dropdownMenuButton'

    expect(page).to have_content 'Log out'
  end

  # Scenario: User cannot sign in with wrong email
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong email
  #   Then I see an invalid email message
  scenario 'user cannot sign in with wrong email', js: true do
    signin_user('invalid@email.com', user.password)

    expect(page).to have_content 'Invalid Email or password'
  end

  # Scenario: User cannot sign in with wrong password
  #   Given I exist as a user
  #   And I am not signed in
  #   When I sign in with a wrong password
  #   Then I see an invalid password message
  scenario 'user cannot sign in with wrong password', js: true do
    signin_user(user.email, 'asdfgh')

    expect(page).to have_content 'Invalid Email or password'
  end
end
