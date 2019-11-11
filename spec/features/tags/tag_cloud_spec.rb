# frozen_string_literal: true

require 'rails_helper'

# Feature: Visit admin page and create tag, than visit games page and select tag form cloud and see that page is filtered by this tag
feature 'Filter games page by tag', type: :feature do
  before do
    create(:game, name: 'Fifa')
    create(:tagging)
  end

  # Scenario: I visit games page
  #   When I click on tag 'RPG' on tag cloud on games page
  #   Then I see a game with tag
  scenario 'Search for a game successfully by tag', js: true do
    visit games_path
    click_link 'RPG'
    expect(page).to have_content 'Duke Nukem'
    expect(page).not_to have_content 'Fifa'
  end
end
