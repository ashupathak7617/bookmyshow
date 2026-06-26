class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  allow_browser versions: :modern

  def movie
    @movie ||= Movie.find(movie_params)
  end

  def movie_params
    params[:movie_id] || params[:id]
  end

  def current_customer
    authenticate_customer!
    @current_customer
  end

  private

  def authenticate_customer!
    token = request.headers["Authorization"]&.split(" ")&.last

    if token.present?
      begin
        decoded = Warden::JWTAuth::TokenDecoder.new.call(token)
        @current_customer = Customer.find(decoded["sub"])
      rescue => e
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
