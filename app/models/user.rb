class User < ActiveRecord::Base

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  before_save :user_to_down

  def user_to_down
    #binding.pry
    self.username = self.username.downcase
  end

end
