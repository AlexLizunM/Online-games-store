# frozen_string_literal: true

require 'rails_helper'

feature 'Add and remove game from my bucket through game page', type: :feature do
  let!(:game) { create(:game) }
  let(:user) { create(:user, :confirmed) }

  scenario 'I visit game page and can see add to my bucket button if im signed in', js: true do
    signin_user(user.email, user.password)
    visit game_path(game)

    expect(page).to have_selector(:link_or_button, 'Add to Bucket')
  end

  scenario 'I visit game page and if im not signed in i cant see add to bucket button', js: true do
    visit game_path(game)

    expect(page).not_to have_selector(:link_or_button, 'Add to Bucket')
  end

  scenario 'I visit game page and click add to bucket button', js: true do
    signin_user(user.email, user.password)
    visit game_path(game)
    
    expect { click_button 'Add to Bucket' }.to change { BucketItem.count }.by(1)
    expect(page).to have_selector(:link_or_button, 'Remove from Bucket')
    expect(page).to have_content 'Added to your Bucket'
  end

  scenario 'I visit game page and after clicking add to bucket button click on remove button', js: true do
    signin_user(user.email, user.password)
    visit game_path(game)
    click_button 'Add to Bucket'
    
    expect { click_button 'Remove from Bucket' }.to change { BucketItem.count }.by(-1)
    expect(page).to have_selector(:link_or_button, 'Add to Bucket')
  end
end
