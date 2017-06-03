class WelcomeController < ApplicationController
  def index
    @games = current_creator.games if creator_signed_in?
  end
end
