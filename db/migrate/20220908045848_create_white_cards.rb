class CreateWhiteCards < ActiveRecord::Migration[6.1]
  def change
    create_table :white_cards do |t|
      t.string :content
      t.boolean :in_deck
      t.boolean :in_hand
      t.boolean :drawn
      t.boolean :used

      t.timestamps
    end
  end
end
