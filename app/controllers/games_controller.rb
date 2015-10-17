class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :rules, :categories]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    #binding.pry
  end

  def make_questions
    @game = Game.find(params[:num_game])
    quest_info = Question.find(@game.table_questions[params[:num].to_i].to_i)
    #binding.pry
    redirect_to questions_game_path(:question_id => quest_info.id, :id => @game.id, :num => params[:num], :difficulty => params[:difficulty])
  end

  def make_desempate
    quest_info = Question.all
    @quest_info = quest_info.sample
    @game = Game.find(params[:id])
    redirect_to desempate_game_path(id: @game.id, question_id: @quest_info.id)
  end

  def desempate
    @game = Game.find(params[:id])
    @game.table_values[params[:num].to_i] = false
    @game.save
    gon.tiempo = @game.tiempo

    @quest_info = Question.find(params[:question_id])
    @imgquest = Image.find_by question_id: @quest_info.id
    @imgans = QuestImag.find_by question_id: @quest_info.id
    @player = Player.where(game_id: @game.id).order("id")
  end

  def questions
    @points = params[:difficulty].to_i
    #binding.pry
    @game = Game.find(params[:id])
    @game.table_values[params[:num].to_i] = false
    @game.save
    gon.tiempo = @game.tiempo

    @quest_info = Question.find(params[:question_id])
    @imgquest = Image.find_by question_id: @quest_info.id
    @imgans = QuestImag.find_by question_id: @quest_info.id
    @player = Player.where(game_id: @game.id).order("id")
    #binding.pry
  end

  def test
    #binding.pry
    @game = Game.find(params[:id])
    @game.table_values[params[:num].to_i] = false
    @game.save
    gon.tiempo = @game.tiempo

    @quest_info = Question.find(params[:question_id])
    @imgquest = Image.find_by question_id: @quest_info.id
    @player = Player.where(game_id: @game.id)
    #binding.pry
  end

  def game

    #game_categories = GameCategory.where(game_id: params[:id])
    @player = Player.where(game_id: params[:id])
    @game = Game.find(params[:id])
    #binding.pry
    if (@game.table_values.all? {|value| value == false })
      @game.table_values[0] = true
      puntos = @player.group("points").count("points")
      puntos_max = puntos.max_by {|x,y| x}
      #binding.pry
      if puntos_max[1] > 1
        redirect_to make_desempate_game_path
      else
        @player = @player.order(points: :desc).first
      end
    end
  end

  def fill_questions
    @game = Game.find(params[:id])
  end

  def restart
    @game = Game.find(params[:id])
    lesize = @game.table_values.size
    i = 1
    while i <= lesize  do
      @game.table_values[i] = true
      i +=1
    end
    @game.save
    player = Player.where(game_id: @game.id)
    player.each do |jugador|
      jugador.destroy
    end
    redirect_to root_path
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  def save_questions
    @game = Game.find(params[:id])
    @game.table_questions[params[:num].to_i] = params[:question]
    @game.save
    redirect_to fill_questions_game_path(@game.id)
  end

  def select_questions
    #binding.pry
    @questions = Question.all
    @game = Game.find(params[:id])
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
          #binding.pry
          @game.table_questions << 0
          @game.table_values << false
        else
          @game.table_questions << 0
          @game.table_values << true
        end
        #binding.pry
        break if i == (@game.num_categories * @game.num_questions)
        i += 1
      end
      if @game.save
        redirect_to fill_questions_game_path(@game.id)
        #redirect_to new_game_player_path(@game.id)
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
