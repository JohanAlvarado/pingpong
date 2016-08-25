class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  #has_many :games
  #has_many :opponent_games, class_name: 'Game', inverse_of: :opponent

  scope :opponents, ->(user) { where.not(id: user) }

  def to_s
    email
  end

  def games
    Game.of_user(id)
  end

  def opponents
    User.opponents(id)
  end
end
