class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to  new_user_gameroom_path(@user)
    else
      render :new
    end
  end

  def destroy
      #destroy user after 24 hrs...how?
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
