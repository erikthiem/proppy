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
    if @game.locked then
      redirect_to root_path, alert: "Sorry, this game has been locked!"
    else
      @submission = Submission.new
      @submission.game = @game
    end
  end

  # POST /submissions
  # POST /submissions.json
  def create
    parse_submit_params
    redirect_to root_path
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

  private

  def parse_submit_params
    submission = params[:submission]
    game = Game.from_code(submission[:code])
    name = submission[:name]
    answers = submission[:answers]

    @submission = Submission.create(:game => game, :name => name, :answers => answers)
  end

end
