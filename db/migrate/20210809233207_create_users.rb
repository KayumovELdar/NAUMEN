# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :l_name, :f_name, :s_name
      t.timestamps
    end
  end
end
