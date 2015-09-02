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

  def answer
    @quest_info = Question.find(params[:pregunta])
    @id = params[:num]
  end

  def question
    #binding.pry
    cat = params[:categoria]
    dif = params[:difficulty]
    eval_block(cat, dif, params[:num])
    quest_info = Question.where(:categoria => params[:categoria], :difficulty => params[:difficulty])
    @id = params[:num]
    @quest_info = quest_info.sample
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

    def eval_block(i, j, id)
      i = i.to_i - 1
      j = j.to_i - 1
      case j
      when 0
       case i
       when 0
          Game.update(id, :q_1_1 => false)

       when 1
          Game.update(id, :q_1_2 => false)

       when 2
          Game.update(id, :q_1_3 => false)

       when 3
          Game.update(id, :q_1_4 => false)

       when 4
          Game.update(id, :q_1_5 => false)

       end
      when 1
       case i
       when 0
          Game.update(id, :q_2_1 => false)

       when 1
          Game.update(id, :q_2_2 => false)
       when 2
          Game.update(id, :q_2_3 => false)

       when 3
          Game.update(id, :q_2_4 => false)

       when 4
          Game.update(id, :q_2_5 => false)

       end
      when 2
       case i
       when 0
          Game.update(id, :q_3_1 => false)

       when 1
          Game.update(id, :q_3_2 => false)

       when 2
          Game.update(id, :q_3_3 => false)

       when 3
          Game.update(id, :q_3_4 => false)

       when 4
          Game.update(id, :q_3_5 => false)

       end
      when 3
       case i
       when 0
          Game.update(id, :q_4_1 => false)

       when 1
          Game.update(id, :q_4_2 => false)

       when 2
          Game.update(id, :q_4_3 => false)

       when 3
          Game.update(id, :q_4_4 => false)

       when 4
          Game.update(id, :q_4_5 => false)

       end
      when 4
       case i
       when 0
          Game.update(id, :q_5_1 => false)

       when 1
          Game.update(id, :q_5_2 => false)

       when 2
          Game.update(id, :q_5_3 => false)

       when 3
          Game.update(id, :q_5_4 => false)

       when 4
          Game.update(id, :q_5_5 => false)

       end
      end
    end
end
