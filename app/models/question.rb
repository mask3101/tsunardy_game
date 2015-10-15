class Question < ActiveRecord::Base
  belongs_to :category
  has_many :game_questions
  has_many :games, through: :game_questions

  validates :question, presence: true
  validates :answer, presence: true
  

  before_save :activate_question_act

  def set_points
    self.points = self.difficulty.to_i * 100
  end

  def activate_question_act
    self.active_question = true
  end


  def initialize(params = {})
  file = params.delete(:data)
  super
  if file
    self.filename = sanitize_filename(file.original_filename)
    self.mime_type = file.content_type
    self.data = file.read
  end
end
private
  def sanitize_filename(filename)
    return File.basename(filename)
  end

  
end
