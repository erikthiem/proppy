class Game < ApplicationRecord
  has_many :questions
  belongs_to :creator
end
