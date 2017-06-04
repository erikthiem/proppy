class Game < ApplicationRecord
  validates :title, presence: true

  has_many :questions, dependent: :destroy
  has_many :submissions, dependent: :destroy
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

  def submission_form_fields
  	fields = ""
  	self.questions.each do |question|
  		fields += """
  		<h4>#{question.title}</h4>
        <div class='form-group'>
          <div class='btn-group styled-select slate'>
            <%= f.select(:business_type, [[#{question.response1}, '1'], [#{question.response2}, '2']], {}, { :class => 'btn dropdown-toggle btn-default' }) %>
          </div>
        </div>
        """
  	end
  	fields
  end

  def lock!
    self.locked = true
    self.save
  end


end
