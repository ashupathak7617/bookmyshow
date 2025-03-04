class ScreensController < ApplicationController
  def index
    @screen = Screen.where(theater_id: params[:id])
    @theater = Theater.find(params[:th])
  end
end
