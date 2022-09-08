class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gameroom, null: false, foreign_key: true
      t.references :white_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
