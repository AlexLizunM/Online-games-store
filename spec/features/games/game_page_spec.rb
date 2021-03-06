# frozen_string_literal: true

require 'rails_helper'

# Feature: Visit game page
#   I want to visit game page
feature 'Visit game page', type: :feature do
  let!(:game) { create(:game) }
  # Scenario: I visit game page successfully
  #   When I click on game cover on page with games
  #   Then I visit a game page
  scenario 'Search for a game successfully by name', js: true do
    visit game_path(game) 
    expect(page).to have_content 'Duke Nukem'
    expect(page).to have_content '50'
    expect(page).to have_content 'good game'
    expect(page).to have_css('img')
  end
end
