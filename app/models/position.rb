# frozen_string_literal: true

class Position < ApplicationRecord
  has_many :employment_terms
  has_many :users, through: :employment_terms
end
