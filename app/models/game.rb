class Game < ActiveRecord::Base
  validates :num_players, presence: true, on: :update
  validates :num_questions, presence: true, on: :update
  validates :num_categories, presence: true, on: :update
end
