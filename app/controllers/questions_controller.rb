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
    quest_cat1_1 = Question.where(:categoria => 1, :difficulty => 1)
    quest_cat2_1 = Question.where(:categoria => 2, :difficulty => 1)
    quest_cat3_1 = Question.where(:categoria => 3, :difficulty => 1)
    quest_cat4_1 = Question.where(:categoria => 4, :difficulty => 1)
    quest_cat5_1 = Question.where(:categoria => 5, :difficulty => 1)
    quest_cat1_2 = Question.where(:categoria => 1, :difficulty => 2)
    quest_cat2_2 = Question.where(:categoria => 2, :difficulty => 2)
    quest_cat3_2 = Question.where(:categoria => 3, :difficulty => 2)
    quest_cat4_2 = Question.where(:categoria => 4, :difficulty => 2)
    quest_cat5_2 = Question.where(:categoria => 5, :difficulty => 2)
    quest_cat1_3 = Question.where(:categoria => 1, :difficulty => 3)
    quest_cat2_3 = Question.where(:categoria => 2, :difficulty => 3)
    quest_cat3_3 = Question.where(:categoria => 3, :difficulty => 3)
    quest_cat4_3 = Question.where(:categoria => 4, :difficulty => 3)
    quest_cat5_3 = Question.where(:categoria => 5, :difficulty => 3)
    quest_cat1_4 = Question.where(:categoria => 1, :difficulty => 4)
    quest_cat2_4 = Question.where(:categoria => 2, :difficulty => 4)
    quest_cat3_4 = Question.where(:categoria => 3, :difficulty => 4)
    quest_cat4_4 = Question.where(:categoria => 4, :difficulty => 4)
    quest_cat5_4 = Question.where(:categoria => 5, :difficulty => 4)
    quest_cat1_5 = Question.where(:categoria => 1, :difficulty => 5)
    quest_cat2_5 = Question.where(:categoria => 2, :difficulty => 5)
    quest_cat3_5 = Question.where(:categoria => 3, :difficulty => 5)
    quest_cat4_5 = Question.where(:categoria => 4, :difficulty => 5)
    quest_cat5_5 = Question.where(:categoria => 5, :difficulty => 5)
    @question = []
    @question << (quest_cat1_1 == [] ? "" : quest_cat1_1.sample)
    @question << (quest_cat2_1 == [] ? "" : quest_cat2_1.sample)
    @question << (quest_cat3_1 == [] ? "" :  quest_cat3_1.sample)
    @question << (quest_cat4_1 == [] ? "" :  quest_cat4_1.sample)
    @question << (quest_cat5_1 == [] ? "" :  quest_cat5_1.sample)
    @question << (quest_cat1_2 == [] ? "" :  quest_cat1_2.sample)
    @question << (quest_cat2_2 == [] ? "" :  quest_cat2_2.sample)
    @question << (quest_cat3_2 == [] ? "" :  quest_cat3_2.sample)
    @question << (quest_cat4_2 == [] ? "" :  quest_cat4_2.sample)
    @question << (quest_cat5_2 == [] ? "" :  quest_cat5_2.sample)
    @question << (quest_cat1_3 == [] ? "" :  quest_cat1_3.sample)
    @question << (quest_cat2_3 == [] ? "" :  quest_cat2_3.sample)
    @question << (quest_cat3_3 == [] ? "" :  quest_cat3_3.sample)
    @question << (quest_cat4_3 == [] ? "" :  quest_cat4_3.sample)
    @question << (quest_cat5_3 == [] ? "" :  quest_cat5_3.sample)
    @question << (quest_cat1_4 == [] ? "" :  quest_cat1_4.sample)
    @question << (quest_cat2_4 == [] ? "" :  quest_cat2_4.sample)
    @question << (quest_cat3_4 == [] ? "" :  quest_cat3_4.sample)
    @question << (quest_cat4_4 == [] ? "" :  quest_cat4_4.sample)
    @question << (quest_cat5_4 == [] ? "" :  quest_cat5_4.sample)
    @question << (quest_cat1_5 == [] ? "" :  quest_cat1_5.sample)
    @question << (quest_cat2_5 == [] ? "" :  quest_cat2_5.sample)
    @question << (quest_cat3_5 == [] ? "" :  quest_cat3_5.sample)
    @question << (quest_cat4_5 == [] ? "" :  quest_cat4_5.sample)
    @question << (quest_cat5_5 == [] ? "" :  quest_cat5_5.sample)

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
