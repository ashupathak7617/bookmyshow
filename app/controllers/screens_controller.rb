class ScreensController < ApplicationController
  def index
    @screen = Screen.where(theater_id: params[:id])
  end
end
