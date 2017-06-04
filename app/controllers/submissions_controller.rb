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
  	#@game = Game.from_code(code)
    @submissions = Submissions.new
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new
    @game.creator = current_creator

  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
  end

end
