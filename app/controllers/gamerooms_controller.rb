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
    @gameroom = Gameroom.find(params[:id])
    @blue_deck = BlueCard.all.where(gameroom_id: @gameroom.id)
    @white_deck = WhiteCard.all.where(gameroom_id: @gameroom.id)
    last_card = @blue_deck.count
    index = rand(0..last_card)
    text = @blue_deck[index].content
  end
end
