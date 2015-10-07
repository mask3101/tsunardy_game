class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players/1
  # GET /players/1.json

  def the_points

    @player = Player.find(params[:id])
    @player.points_player_sum(params[:points_val].to_i, params[:sum])
    @player.update(points: @player.points)
  end

  # def points_player
  #   @player = Player.find(params[:id])
  #   @player.points_player_sum(params[:points_val])
  #   @player.save
  #   redirect_to questions_game_path
  # end

  def show
  end

  # GET /players/new
  def new
    @game = Game.find(params[:game_id])
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    #binding.pry
    #params[:name].each do |name|
    validation = 0
    @game = Game.find(params[:game_id])
    #binding.pry
    if params[:name].include?("")
      validation = 1
      @player = Player.new
    end
    #@player = Player.new(player_params)

    if validation == 0
      #flash[:notice] = "La pregunta se ha creado."
      params[:name].each do |name|
      #binding.pry
        @player = Player.create(:name => name, :game_id => params[:game_id].to_i)
      end
      redirect_to games_game_path(@game.id)
    else
      #player = Player.find_by game_id: @game_id
      #binding.pry
      flash[:error] = "El jugador no se pudo crear, verificar que ningun nombre quedó vacio"
      render :new
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(name: [])
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
