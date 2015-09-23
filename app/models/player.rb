class Player < ActiveRecord::Base

  validates :name, presence: true

  before_save :set_points

  def set_points
    self.points = 0
  end

end
