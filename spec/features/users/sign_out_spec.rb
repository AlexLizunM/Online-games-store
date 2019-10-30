# frozen_string_literal: true
# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', type: :feature do
  let(:user) { create(:user, :confirmed) }

  before do
    signin_user(user.email, user.password)
    click_button 'dropdownMenuButton'
    click_link 'Log out'
  end
  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs out successfully' do
    expect(page).to have_content I18n.t('devise.sessions.signed_out')
  end

  scenario 'link to login appear successfully' do
    expect(page).to have_content 'Log in'
  end

  scenario 'link to signup appear successfully' do
    expect(page).to have_content 'Sign up'
  end
end
