class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_creator!

  # GET /games
  # GET /games.json
  def index
    @games = current_creator.games
  end

  # GET /games/1
  # GET /games/1.json
  def show
    set_game
    @questions = @game.questions
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # GET /games/select
  def select
  end

  def create_nba
    puts 'derrnnn!'
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new
    @game.title = params[:game][:title]
    acceptableQuestionPattern = Regexp.new(/^question_[1-9][0-9]*/)
    params[:game].each do |key, questionTitle|
      if key.match acceptableQuestionPattern
        question = Question.new(:title => questionTitle)
        @game.questions.push question
      end
    end

    @game.creator = current_creator
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
        @game.creator.send_game_created_email(@game)
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = current_creator.games.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title)
    end
end
