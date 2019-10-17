class GamesController < ApplicationController

  def index
    @pagy, @games = pagy(Game.all, items:9)
  end
end
