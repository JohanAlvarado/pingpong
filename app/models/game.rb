class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent, class_name: 'User'

  before_save :calculate_result

  scope :of_user, ->(user) {
    games = Game.arel_table
    where(games[:user_id].eq(user).or(games[:opponent_id].eq(user)))
  }

  def calculate_result
    if user_score > opponent_score
      self.won = true
    end
  end

end
