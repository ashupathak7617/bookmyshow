class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # before_action :authenticate_customer!
  def movie
    @movie ||= Movie.find(movie_params)
  end

  def movie_params
    params[:movie_id] || params[:id]
  end
end
