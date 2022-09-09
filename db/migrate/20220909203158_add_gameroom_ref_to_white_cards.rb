class AddGameroomRefToWhiteCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :white_cards, :gameroom, foreign_key: true
  end
end
