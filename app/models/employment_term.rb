# frozen_string_literal: true

class EmploymentTerm < ApplicationRecord
  belongs_to :user
  belongs_to :position
  validate :validate_status, on: :create

  def validate_status
    errors.add(:employment_term, 'сотрудник еще назначен на другую должность') if EmploymentTerm.where(
      user_id: user_id, end_date: nil
    ).any?
  end
end
