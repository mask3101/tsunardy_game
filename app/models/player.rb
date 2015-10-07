class Player < ActiveRecord::Base

  validates :name, presence: true

  before_create :set_points

  def set_points
    self.points = 0
  end

  def points_player_sum(valor, sum)
    if sum == "true"
      self.points = self.points + (valor * 100)
    else
      self.points = self.points - (valor * 100)
    end
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
