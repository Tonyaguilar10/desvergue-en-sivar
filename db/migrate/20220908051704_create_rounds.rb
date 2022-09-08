class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.references :gameroom, null: false, foreign_key: true
      t.references :blue_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
