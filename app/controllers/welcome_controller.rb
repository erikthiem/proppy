class WelcomeController < ApplicationController
  def index
  	@games = current_creator.games
  end
end
