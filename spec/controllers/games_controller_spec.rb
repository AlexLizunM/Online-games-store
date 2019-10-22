# frozen_string_literal: true

require 'rails_helper'

describe GamesController do
  describe 'Search' do
    let!(:game_to_search) { create(:game, name: 'Portal', price: 2000) }
    let!(:game_to_fail) { create(:game, name: 'Fifa', price: 5000) }

    it 'Searchs for games due to name param' do
      get :index, params: { q: { name_cont: 'port' } }
      expect(@controller.view_assigns['games']).to contain_exactly(game_to_search)
    end

    it 'Searchs for games due to price param' do
      get :index, params: { q: { price_money_gteq: 10, price_money_lteq: 30 } }
      expect(@controller.view_assigns['games']).to contain_exactly(game_to_search)
    end
  end
end
