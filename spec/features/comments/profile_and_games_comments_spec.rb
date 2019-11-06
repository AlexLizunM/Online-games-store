# frozen_string_literal: true

require 'rails_helper'

# Feature: Visit my comments page
#   I want to visit my comments page
feature 'Look at my comments', type: :feature do
  let(:game) { create(:game) }
  let(:user) { create(:user, :confirmed) }

  before do
    signin_user(user.email, user.password)
    visit game_path(game)
  end

  scenario 'I can see comment in my comments if i added it', js: true do
    fill_in('comment_content', with: 'Good Game')
    select('5', from: 'comment_rating')

    expect { click_button 'Save' }.to change { Comment.count }.by(1)

    visit user_comments_path(user)

    expect(page).to have_content 'Duke Nukem'
    expect(all('span.fa.fa-star.checked').count).to be 5
    expect(page).to have_content 'Good Game'
    expect(page).to have_css('.btn.fas.fa-trash.btn-primary')
  end

  scenario 'I can see comment at the game page if i added it', js: true do
    create(:comment, user: user, game: game)
    visit game_path(game)

    expect(page).to have_content 'Good Game'
    expect(all('span.fa.fa-star.checked').count).to be 10
  end

  scenario 'I can see that comment was deleted from my comments if i click on remove button', js: true do
    create(:comment, user: user)
    visit user_comments_path(user)
    expect { page.find('.btn.fas.fa-trash.btn-primary').click }.to change(Comment,:count).by(-1)
  end
end
