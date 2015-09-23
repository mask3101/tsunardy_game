class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @categories = Category.all
  end

  def sum
    
    player = params[:quest_info]
    player.points = player.points 
    respond_to do |format|
      format.html do
        if @vote.valid?  
          flash[:notice] = "Your vote is counted"
        else
          flash[:error] = "You can only vote in a post once"
        end
        redirect_to :back
      end
      format.js 
    end
  end

  def answer
    #binding.pry
    @quest_info = Question.find(params[:pregunta])
    @id = params[:num_game]
    @player = Player.where(game_id: params[:num_game])
  end

  def question
    #binding.pry

    cat = params[:categoria]
    dif = params[:difficulty]
    game = Game.find(params[:num_game])
    game.table_values[params[:num].to_i] = false
    game.save
    quest_info = Question.where(:categoria => params[:categoria], :difficulty => params[:difficulty])
    @id = params[:num_game]
    @game = Game.find(params[:num_game])
    gon.tiempo = @game.tiempo

    @quest_info = quest_info.sample
    #binding.pry
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = "La pregunta se ha creado."
      redirect_to new_question_path
    else
      flash[:error] = "La pregunta no se pudo crear."
      render :new
    end
  end

  def game_question

  end

  def game_ans

  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def game
    @question = Question.all

  end



  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :answer, :difficulty, :categoria)
      #params[:question]
    end


end
