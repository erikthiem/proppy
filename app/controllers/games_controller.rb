class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_creator!

  # GET /games
  # GET /games.json
  def index
    @games = current_creator.games
    redirect_to root_path
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
    @questions = @game.questions
  end

  # GET /games/1/edit
  def edit
    if not @game.locked then
      @questions = @game.questions
    else
      redirect_to root_path
    end
  end

  # GET /games/select
  def select
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new
    parse_game_params

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
    if not @game.locked
      parse_game_params

      respond_to do |format|
        if @game.update(:id => params[:id])
          format.html { redirect_to @game, notice: 'Game was successfully updated.' }
          format.json { render :show, status: :ok, location: @game }
        else
          format.html { render :edit }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  def update_correct_answers
    set_game
    parse_correct_answers
    redirect_to root_path
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

  # POST /games/1/lock
  def lock
    set_game
    @game.lock!
    redirect_to root_path
  end

  def play
    set_game
    @questions = @game.questions
  end

  def live
    set_game

    redirect_to root_path if not @game.locked
    @questions = @game.questions
    @submissions = @game.submissions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = current_creator.games.find(params[:id])
    end

    def parse_game_params
      @game.title = params[:game][:title]
      @game.questions.clear
      acceptableQuestionPattern = Regexp.new(/^question_[1-9][0-9]*$/)
      params[:game].each do |key, questionTitle|
        if key.match acceptableQuestionPattern
          if not questionTitle.empty? then
            response1 = params[:game]["#{key}_response_1"]
            response2 = params[:game]["#{key}_response_2"]

            question = Question.new(:title => questionTitle, :response1 => response1, :response2 => response2)
            @game.questions.push question
          end
        end
      end
    end

    def parse_correct_answers
      acceptableQuestionPattern = Regexp.new(/^question_[1-9][0-9]*$/)
      params.each do |key, response|
        if key.match acceptableQuestionPattern
          i = key.split("_")[1].to_i - 1
          @game.questions[i].correct_response = response[:correct_response]
          @game.save
        end
      end
    end
end
