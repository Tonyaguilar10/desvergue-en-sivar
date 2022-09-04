class ChallengesController < ApplicationController
  skip_before_action only: [ :home ]
  before_action :set_challenge, only: %i[show edit update]

  def home

  end

  def index
    @blue = Challenge.all
  end

  def new
    @blue = Challenge.new
  end

  def create
    @blue = Challenge.new(challenge_params)
    if @blue.save
      redirect_to challenge_path(@blue)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @blue.update(challenge_params)
    redirect_to challenge_path
  end

  private

  def set_challenge
    @blue = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:text)
  end

end
