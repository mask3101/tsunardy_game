class Category < ActiveRecord::Base
  has_many :game_categories
  has_many :games, through: :game_categories
  has_many :questions
  validates :name, presence: true
end
