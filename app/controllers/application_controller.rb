class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  allow_browser versions: :modern
  
  def movie
    @movie ||= Movie.find(movie_params)
  end

  def movie_params
    params[:movie_id] || params[:id]
  end
end
