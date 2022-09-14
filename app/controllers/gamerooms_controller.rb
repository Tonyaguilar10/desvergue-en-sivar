class GameroomsController < ApplicationController

  def index
    @gameroom = Gameroom.new
    @rooms = Gameroom.all
  end

  def new
    @user = User.find(params[:user_id])
    @gameroom = Gameroom.new

    if params[:query].present?

      @room = Gameroom.find_by(password: params[:query].to_i)
    end

  end

  def create
    # first I find the user
    @user = User.find(params[:user_id])
    # I create the game room and make sure is created
    @gameroom = Gameroom.new
    until @gameroom.save do
      @gameroom.user = @user
      @password = rand(6 ** 6)
      @gameroom.password = @password
      @gameroom.save
    end
    # creating the blue deck of the room and getting the info from the DB
    blue_db = Challenge.all
    blue_db.each do |card|
      blue_deck = BlueCard.new(content: card.text, in_deck: true, drawn: false, used: false, gameroom_id: @gameroom.id)
      blue_deck.save
    end
    # creating white deck of the room and getting the info from the DB
    white_db = Response.all
    white_db.each do |card|
      white_deck = WhiteCard.new(content: card.sentence, in_deck: true, in_hand: false, drawn: false, used: false, gameroom_id: @gameroom.id)
      white_deck.save
    end
    redirect_to user_gameroom_path(@user, @gameroom)
  end

  def show
    @user = User.find(params[:user_id])
    @gameroom = Gameroom.find(params[:id])
    @blue_deck = BlueCard.all.where(gameroom_id: @gameroom.id).and(BlueCard.all.where(in_deck: true))
    @blue_drawn = BlueCard.all.where(gameroom_id: @gameroom.id).and(BlueCard.all.where(drawn: true))
    @white_deck = WhiteCard.all.where(gameroom_id: @gameroom.id)
    if @blue_deck.empty? && @blue_drawn.count < 1
      @text = "Start over the game"
    else
      draw_card = BlueCard.find_by(drawn: true)
      if draw_card.nil?
        @text = "Que empiece el desvergue"
      else
        @text = draw_card.content
      end
    end
  end

  def get_blue_card
    @user = User.find(params[:user_id])
    @gameroom = Gameroom.find(params[:gameroom_id])
    @blue_deck = BlueCard.all.where(gameroom_id: @gameroom.id).and(BlueCard.all.where(in_deck: true))
    # @white_deck = WhiteCard.all.where(gameroom_id: @gameroom.id)
    card_in_deck = BlueCard.find_by(drawn: true)
    if card_in_deck.nil? == false
      card_in_deck.drawn = false
      card_in_deck.used = true
      card_in_deck.save
    end
    last_card = @blue_deck.count
    index = rand(1..last_card)
    draw_card = @blue_deck[index - 1]
    until draw_card.in_deck
      index = rand(0..last_card)
      draw_card = @blue_deck[index]
    end
    draw_card.drawn = true
    draw_card.in_deck = false
    draw_card.save
    redirect_to user_gameroom_path(@user, @gameroom)
  end

  def restart_blue_cards
    @user = User.find(params[:user_id])
    @gameroom = Gameroom.find(params[:gameroom_id])
    @blue_deck = BlueCard.all.where(gameroom_id: @gameroom.id).and(BlueCard.all.where(used: true))
    @blue_deck.each do |card|
      card.in_deck = true
      card.drawn = false
      card.used = false
      card.save
    end
    redirect_to user_gameroom_path(@user, @gameroom)
  end
end
