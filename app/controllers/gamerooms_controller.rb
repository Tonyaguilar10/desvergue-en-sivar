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
    @user = User.find(params[:user_id])
    @gameroom = Gameroom.new
    until @gameroom.save do
      @gameroom.user = @user
      @password = rand(6 ** 6)
      @gameroom.password = @password
      @gameroom.save
    end
    redirect_to user_gameroom_path(@user, @gameroom)
  end

  def show
    @gameroom = Gameroom.find(params[:id])
  end
end
