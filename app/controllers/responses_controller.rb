class ResponsesController < ApplicationController

  before_action :set_response, only: %i[show edit update]

  def index
    @white = Response.all
  end

  def new
    @white = Response.new
  end

  def create
    @white = Response.new(response_params)
    if @white.save
      redirect_to response_path(@white)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @white.update(response_params)
    redirect_to response_path
  end

  private

  def set_response
    @white = Response.find(params[:id])
  end

  def response_params
    params.require(:response).permit(:sentence)
  end
end
