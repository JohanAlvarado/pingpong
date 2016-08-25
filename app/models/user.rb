class User < ActiveRecord::Base
  include Rankeable

  devise :database_authenticatable, :registerable, :trackable, :validatable

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
