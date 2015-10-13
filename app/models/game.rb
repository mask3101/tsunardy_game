class Game < ActiveRecord::Base
  has_many :game_categories
  has_many :categories, through: :game_categories

  validates :category_ids, presence: true
  validates :num_questions, presence: true, numericality: { only_integer: true, message: "Tiene que ser formato numerico y mayor a 0" , greater_than: 0}
  validates :tiempo, presence: true, numericality: { only_integer: true, message: "Tiene que ser formato numerico y mayor a 0", greater_than: 0}
  validates :game_name, presence: true

  serialize :table_values, Array
  serialize :table_questions, Array

  before_save :active_game

  def active_game
    self.active = true
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
