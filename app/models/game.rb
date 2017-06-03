class Game < ApplicationRecord
  validates :title, presence: true
  
  has_many :questions
  belongs_to :creator
end
