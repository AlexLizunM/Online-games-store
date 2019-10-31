# frozen_string_literal: true

require 'rails_helper'

# Feature: Search Game
#   I want to search for game
feature 'Search for Game', type: :feature do
  before do
    create(:game, name: 'Portal', price: 2000)
    create(:game, name: 'Fifa', price: 5000)
  end

  # Scenario: I search for game successfully
  #   When I fill in a search form and press submit
  #   Then I have a results of search due to my form content
  scenario 'Search for a game successfully by name', js: true do
    visit games_path 
    fill_in 'q_name_cont', with: 'portal'
    click_button 'Search'
    expect(page).not_to have_content 'Fifa'
  end

  scenario 'Search for a game successfully by price', js: true do
    visit games_path 
    fill_in 'q_price_money_gteq', with: 10
    fill_in 'q_price_money_lteq', with: 30
    click_button 'Search'
    expect(page).not_to have_content 'Fifa'
  end
end
