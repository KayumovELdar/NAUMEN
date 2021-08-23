# frozen_string_literal: true

class User < ApplicationRecord
  has_many :employment_terms
  has_many :positions, through: :employment_terms
  def full_name
    full_name = "#{l_name} #{f_name} #{s_name}"
  end
end
