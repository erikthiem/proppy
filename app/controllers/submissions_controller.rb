class SubmissionsController < ApplicationController

  # GET /submissions
  # GET /submissions.json
  def index
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new?code=XSZ152
  def new
  	@code = params[:code]
  	@game = Game.from_code(@code)
    @submission = Submission.new
    @submission.game = @game
    #@game.submissions << @submission
  end

  # POST /submissions
  # POST /submissions.json
  def create
  	# This will never be hit oddly
  	logger.debug 'herrrr'
    #@submission = Submission.new
    #@game.creator = current_creator
    redirect_to('/')
  end

  # gets hit a
  def update
  	logger.debug 'fukkk'
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
  end

end
