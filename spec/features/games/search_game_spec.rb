# frozen_string_literal: true

require 'rails_helper'

# Feature: Search Game
#   I want to search for game
feature 'Search for Game', type: :feature do
  before do
    create(:game, name: 'Portal')
    create(:game, name: 'Fifa')
  end

  # Scenario: I search for game successfully
  #   When I fill in a search form and press submit
  #   Then I have a results of search due to my form content
  scenario 'Seatch for a game successfully', js: true do
    visit games_path 
    fill_in 'search', with: 'portal'
    click_button 'search-button'
    expect(page).not_to have_content 'Fifa'
  end
end
