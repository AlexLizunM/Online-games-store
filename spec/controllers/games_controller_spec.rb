# frozen_string_literal: true

require 'rails_helper'

describe GamesController do
  describe 'Search' do
    let!(:game1) { create(:game, name: 'Portal') }
    let!(:game2) { create(:game, name: 'Fifa') }

		it 'Searchs for games due to params' do
      get :index, params: { search: 'port' }
      expect(@controller.view_assigns['games']).to contain_exactly(game1)
    end
  end
end
