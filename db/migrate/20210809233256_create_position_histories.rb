# frozen_string_literal: true

class CreatePositionHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :position_histories do |t|
      t.belongs_to :position, null: false
      t.string :name, null: false
      t.datetime :begin_date, null: false
      t.datetime :end_date
      t.timestamps
    end
  end
end
