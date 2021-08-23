# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Position, type: :model do
  it {should have_many(:employment_terms)}
  it {should have_one(:position_history)}
end
