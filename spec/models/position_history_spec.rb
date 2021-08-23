require 'rails_helper'

RSpec.describe PositionHistory, type: :model do
  it { should belong_to(:position) }
end
