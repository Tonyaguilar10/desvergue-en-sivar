class WhiteCardsController < ApplicationController
  def self.create_deck
    white_db = Response.all
    white_db.each do |card|
      white_deck = WhiteCard.new(content: card.sentence, in_deck: true, in_hand: false, drawn: false, used: false)
      white_deck.save
    end
    @white_deck = WhiteCard.all
  end

  def destroy_deck
    # destroy deck once gameroom is closed or destroyed
  end
end
