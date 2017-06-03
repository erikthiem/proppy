require 'rails_helper'

RSpec.describe Creator, type: :model do

  it 'should be a Class' do
    expect(described_class.is_a? Class).to be true
  end

end
