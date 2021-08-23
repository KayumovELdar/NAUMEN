# frozen_string_literal: true

class CreateEmploymentTerms < ActiveRecord::Migration[6.1]
  def change
    create_table :employment_terms do |t|
      t.belongs_to :user, null: false
      t.belongs_to :position, null: false
      t.datetime :end_date

      t.timestamps
    end
  end
end
