class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :rules]

  # GET /games
  # GET /games.json
  def index
    @game = Game.new
  end

  # GET /games/1
  # GET /games/1.json
  def show
    #binding.pry
  end

  def game
    
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    #@game = Game.create(q_1_1: true, q_1_2: true, q_1_3: true, q_1_4: true, q_1_5: true, q_2_1: true, q_2_2: true, q_2_3: true, q_2_4: true, q_2_5: true, q_3_1: true, q_3_2: true, q_3_3: true, q_3_4: true, q_3_5: true, q_4_1: true, q_4_2: true, q_4_3: true, q_4_4: true, q_4_5: true, q_5_1: true, q_5_2: true, q_5_3: true, q_5_4: true, q_5_5: true, p1: 0, p2: 0)
    @game = Game.create(active: true)

    if @game.save
      redirect_to "/games/rules/#{@game.id}"
    else
      flash[:error] = "No se pudo crear el juego."
      render :new
    end
  end

  def rules
    
    #binding.pry
  end

  def update2
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

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :rules }
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
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:num_players, :num_questions, :num_categories)
    end
end
