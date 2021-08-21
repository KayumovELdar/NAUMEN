class CreatePositionHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :position_histories do |t|

      t.timestamps
    end
  end
end
