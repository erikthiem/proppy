class Game < ApplicationRecord
  validates :title, presence: true
  
  has_many :questions
  has_many :submissions
  belongs_to :creator

  before_create :generate_code

  # Check that the submissions associated are properly formed
  validates_associated :submissions

  def Game.from_code(c)
  	Game.find_by_code(c.upcase)
  end

  def generate_code
    self.code = SecureRandom.hex(8)[0,8].upcase
  end


  def submission_form
  	"<%= form_for @submission do |f| %>"
  	

  end



end
