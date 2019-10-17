# frozen_string_literal: true

require 'rails_helper'

# Feature: Create Game
#   As an admin
#   I want to create game
feature 'Create Game', type: :feature do
  let!(:admin) { AdminUser.create!(email: 'admin@example.com', password: 'password') }

  before do
    login_as(admin)
    visit admin_games_path
  end

  # Scenario: Admin create game successfully
  #   Given I am signed in admin
  #   When I click on a new game, fill in forms and save it
  #   Then I create a new game
  scenario 'Admin create a new game successfully', js: true do
    click_link 'New Game'
    fill_in('game_name', with: 'Duke Nenukem')
    fill_in('game_price', with: 99900)
    page.attach_file('game_cover', 'db/picture_for_seed/duke.jpg')
    expect { click_button 'Create Game' }.to change { Game.count }.by(1)
    expect(Game.last.name).to eq('Duke Nenukem')
    expect(Game.last.price).to eq(99900)
    expect(Game.last.cover.attached?).to be true
  end
end