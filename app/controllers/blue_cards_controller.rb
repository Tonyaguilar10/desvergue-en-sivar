class BlueCardsController < ApplicationController

  def self.create_deck
    blue_db = Challenge.all
    gameroom = Gameroom.find(params[:id])
    blue_db.each do |card|
      blue_deck = BlueCard.new(content: card.text, in_deck: true, drawn: false, used: false, gameroom_id: gameroom.id)
      blue_deck.save
    end
    @blue_deck = BlueCard.all
  end

  def destroy_deck
    # destroy deck once gameroom is closed or destroyed
  end

end
