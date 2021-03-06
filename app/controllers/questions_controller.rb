class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.order("id")
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @imgquest = Image.find_by question_id: params[:id]
    # binding.pry
    # if @imgquest.data && @imgquest.mime_type && @imgquest.filename
    #  send_data(@imgquest.data, :type => @imgquest.mime_type, :filename => @imgquest.filename,
    #           :disposition => 'inline')
    
    # send_data @imgquest.data, :type => @imgquest.mime_type, :disposition => 'inline'
    # end

  end

  def delquest
    @question = Question.find(params[:id])
    @image = Image.find(@question.image_id)
    @question.image_id = nil
    @image.destroy

    respond_to do |format|
      if @question.save
        format.html { redirect_to edit_question_path(@question.id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end

  end

  def delans
    @question = Question.find(params[:id])
    @image = QuestImag.find(@question.quest_imags_id)
    @question.quest_imags_id = nil
    @image.destroy

    respond_to do |format|
      if @question.save
        format.html { redirect_to edit_question_path(@question.id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end    
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

  # GET /questions/1/edit
  def edit
    @categories = Category.all
  end

  # POST /questions
  # POST /questions.json
  def create
    if params[:question][:data]
      @image = Image.new(image_params)
    end
    if params[:question][:data2]
      @qimage = QuestImag.new(image_params2)
    end

    @question = Question.new(question_params)

    if @question.save
    if params[:question][:data]
      @image.question_id = @question.id
      if @image.save
        @question.image_id = @image.id
      end
    end
    
    if params[:question][:data2]
      @qimage.question_id = @question.id
      if @qimage.save
        @question.quest_imags_id = @qimage.id
      end
    end
    else
    flash[:error] = "La pregunta no se pudo crear."
    render :new
    end
    
    if @question.save
      flash[:notice] = "La pregunta se ha creado."
      redirect_to new_question_path and return
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
    if params[:question][:data]
      if @question.image_id
        @image = QuestImag.find(@question.image_id)
        @image.destroy
      end
      @image = Image.new(image_params)
      @image.question_id = @question.id
      @image.save(image_params)
      @question.image_id = @image.id
    end
    if params[:question][:data2]
      if @question.quest_imags_id
        @qimage = QuestImag.find(@question.quest_imags_id)
        @qimage.destroy
      end
      @qimage = QuestImag.new(image_params2)
      @qimage.question_id = @question.id
      @qimage.save(image_params2)
      @question.quest_imags_id = @qimage.id
    end

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to edit_question_path(@question.id), notice: 'Question was successfully updated.' }
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

  def show_image
    binding.pry
    @imgquest = question.find(params[:id])
    send_data(@imgquest.data, :type => @imgquest.mime_type, :filename => @imgquest.filename,
              :disposition => 'inline')
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
      params.require(:question).permit(:question, :answer)
      #params[:question]
    end

    def image_params
      params.require(:question).permit(:data)
    end

    def image_params2
      params.require(:question).permit(:data2)
    end

end
