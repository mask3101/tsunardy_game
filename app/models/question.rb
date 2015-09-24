class Question < ActiveRecord::Base
  belongs_to :category
  has_many :game_questions
  has_many :games, through: :game_questions

  validates :question, presence: true
  validates :answer, presence: true
  validates :difficulty, presence: true, numericality: { only_integer: true, message: "Tiene que ser formato numerico y mayor a 0", greater_than: 0}
  validates :categoria, presence: true

  before_save :set_points, :activate_question_act

  def set_points
    self.points = self.difficulty.to_i * 100
  end

  def activate_question_act
    self.active_question = true
  end

end
