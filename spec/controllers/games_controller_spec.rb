# frozen_string_literal: true

require 'rails_helper'

describe GamesController do
  describe 'Search' do
    let!(:game_to_search) { create(:game, name: 'Portal') }
    let!(:game_to_fail) { create(:game, name: 'Fifa') }

    it 'Searchs for games due to params' do
      get :index, params: { q: { name_cont: 'port' } }
      expect(@controller.view_assigns['games']).to contain_exactly(game_to_search)
    end
  end
end
