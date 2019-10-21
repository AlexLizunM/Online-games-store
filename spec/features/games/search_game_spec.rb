# frozen_string_literal: true

require 'rails_helper'

# Feature: Search Game
#   I want to search for game
feature 'Search for Game', type: :feature do
  before do
    game1 = create(:game, name: 'Portal')
    game2 = create(:game, name: 'Fifa')
  end

  # Scenario: I search for game successfully
  #   When I fill in a search form and press submit
  #   Then I have a results of search due to my form content
  scenario 'Seatch for a game successfully', js: true do
    visit games_path 
    fill_in 'search', with: 'portal'
    click_button 'search'
    expect(page).to have_content 'Portal'
  end
end
