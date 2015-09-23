class Game < ActiveRecord::Base
  has_many :game_categories
  has_many :categories, through: :game_categories

  validates :category_ids, presence: true
  validates :num_questions, presence: true

  serialize :table_values, Array

  before_save :active_game

  def active_game
    self.active = true
  end

end
