class SeatsController < ApplicationController
  def index
<<<<<<< HEAD
    @theater = Theater.find(params[:id])
=======
    @seats = Seat.where(screen_id: params[:screen_id])
>>>>>>> e4684c97771acb75df8240fd266a4ba0f54e23c9
  end
end
