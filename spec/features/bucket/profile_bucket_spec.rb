# frozen_string_literal: true

require 'rails_helper'

# Feature: Visit game page
#   I want to visit game page
feature 'Visit my bucket', type: :feature do
  let!(:game) { create(:game) }
  let(:user) { create(:user, :confirmed) }

  scenario 'I can see game in my bucket if i added it', js: true do
    signin_user(user.email, user.password)
    visit game_path(game)

    expect { click_button 'Add to Bucket' }.to change { BucketItem.count }.by(1)
    
    click_button 'dropdownMenuButton'
    click_link 'Your profile'
    click_link 'My Bucket'

    expect(page).to have_content 'Duke Nukem'
    expect(page).to have_content '50'
    expect(page).to have_selector(:link_or_button, 'Remove from Bucket')
  end

  scenario 'I can see that game was deleted from my bucket if i click on remove button', js: true do
    signin_user(user.email, user.password)
    visit game_path(game)
    click_button 'Add to Bucket'
    click_button 'dropdownMenuButton'
    click_link 'Your profile'
    click_link 'My Bucket'

    expect { click_button 'Remove from Bucket' }.to change { BucketItem.count }.by(-1)
    expect(page).not_to have_content 'Duke Nukem'
    expect(page).not_to have_content '50'
    expect(page).not_to have_selector(:link_or_button, 'Remove from Bucket')
  end
end
