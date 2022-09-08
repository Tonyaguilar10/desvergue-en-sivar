class CreateBlueCards < ActiveRecord::Migration[6.1]
  def change
    create_table :blue_cards do |t|
      t.string :content
      t.boolean :in_deck
      t.boolean :drawn
      t.boolean :used

      t.timestamps
    end
  end
end
