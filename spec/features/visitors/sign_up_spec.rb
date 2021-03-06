# frozen_string_literal: true
# Feature: Sign up
#   As a visitor
#   I want to sign up
#   So I can visit protected areas of the site
feature 'Sign Up', type: :feature do
  # Scenario: Visitor can sign up with valid email address and password
  #   Given I am not signed in
  #   When I sign up with a valid email address and password
  #   Then I see a successful sign up message
  scenario 'visitor can confirm after succesfull signing up', js: true do
    signup_visitor('assasin', 'test@example.com', 'please123')

    expect(page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
  end

  # Scenario: Visitor cannot sign up with invalid email address
  #   Given I am not signed in
  #   When I sign up with an invalid email address
  #   Then I see an invalid email message
  scenario 'visitor cannot sign up with invalid email address', js: true do
    signup_visitor('assasin', 'invalid@email', 'please123')

    expect(page).to have_content 'Email is invalid'
  end

  # Scenario: Visitor cannot sign up without password
  #   Given I am not signed in
  #   When I sign up without a password
  #   Then I see a missing password message
  scenario 'visitor cannot sign up without password', js: true do
    signup_visitor('assasin', 'test@example.com', '')

    expect(page).to have_content "Password can't be blank"
  end

  # Scenario: Visitor cannot sign up with a short password
  #   Given I am not signed in
  #   When I sign up with a short password
  #   Then I see a 'too short password' message
  scenario 'visitor cannot sign up with a short password', js: true do
    signup_visitor('assasin', 'test@example.com', '123')

    expect(page).to have_content 'Password is too short'
  end
end
