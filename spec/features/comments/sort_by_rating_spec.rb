# frozen_string_literal: true

require 'rails_helper'

# Feature: Visit my comments page
#   I want to visit my comments page
feature 'Look at my comments', type: :feature do
  before do
    create(:game, average_rating: 5, name: 'Skyrim')
    create(:game, average_rating: 2)
    visit games_path
  end

  scenario 'I can see games sorted right when sorted ASC', js: true do
    click_link 'Rating'

    expect(page.find(:xpath, '/HTML/BODY[1]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/DIV[1]')).to have_content 'Duke Nukem'
  end

  scenario 'I can see games sorted right when sorted DESC', js: true do
    click_link 'Rating'
    click_link 'Rating'

    expect(page.find(:xpath, '/HTML/BODY[1]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/DIV[1]')).to have_content 'Skyrim'

  end
end
