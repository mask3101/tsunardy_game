class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :rules, :categories]

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

  def questions
    #binding.pry
    game = Game.find(params[:num_game])
    game.table_values[params[:num].to_i] = false
    game.save
    quest_info = Question.where(:category_id => params[:categoria], :difficulty => params[:difficulty])
    @id = params[:num_game]
    @game = Game.find(params[:num_game])
    gon.tiempo = @game.tiempo
    
    @quest_info = quest_info.sample
    @imgquest = Image.find_by question_id: @quest_info.id
    @player = Player.where(game_id: params[:num_game])
    #binding.pry
  end

  def game

    #game_categories = GameCategory.where(game_id: params[:id])
    @player = Player.where(game_id: params[:id])
    @game = Game.find(params[:id])
    #binding.pry
    if (@game.table_values.all? {|value| value == false })
      @game.table_values[0] = true
      @player = @player.sort! {|a,b| a.points <=> b.points }
    end
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
    @game = Game.create(game_params)
    @game.num_categories = params[:game][:category_ids].size - 1
    #binding.pry
    if (@game.num_categories > 0 && @game.num_categories != nil)
      i = 0
      loop do
        if i == 0
          @game.table_values << false
        else
          @game.table_values << true
        end
        #binding.pry
        break if i == (@game.num_categories * @game.num_questions)
        i += 1
      end
      if @game.save
        redirect_to new_game_player_path(@game.id)
      else
        flash[:error] = "No se pudo crear el juego. Favor de llenar los campos faltantes"
        render :new
      end
    elsif @game.tiempo == 0
      flash[:error] = "El tiempo tiene que ser un número mayor"
      render :new
    end

  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    #binding.pry
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_game_path(@game.id), notice: 'Game was successfully updated.' }
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
      params.require(:game).permit(:game_name, :tiempo, :num_questions, category_ids: [])
    end

    def bubble_sort
    n = self.length
    loop do
      swapped = false

      (n-1).times do |i|
      if self[i].points > self[i+1].points
        self[i], self[i+1] = self[i+1], self[i]
        swapped = true
      end
    end
      break if not swapped
    end
    self
  end
end
