class Creator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games


  def send_game_created_email(game)
  	CreatorNotifierMailer.game_created(self, game).deliver_now
  end
end
