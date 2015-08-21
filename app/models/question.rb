class Question < ActiveRecord::Base

  validates :question, presence: true
  validates :answer, presence: true
  validates :difficulty, presence: true
  validates :categoria, presence: true

  before_save :set_points, :activate_question_act

  def set_points
    case self.difficulty
    when 1
    self.points = 100
    when 2
    self.points = 200
    when 3
    self.points = 300
    when 4
    self.points = 400
    when 5
    self.points = 500
    end
  end

  def activate_question_act
    self.active_question = true
  end

end
