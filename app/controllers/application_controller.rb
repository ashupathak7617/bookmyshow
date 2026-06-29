class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :api_request?

  def api_request?
    request.headers["Authorization"].present? ||
    request.content_type&.include?("application/json") ||
    (request.format.json? && !request.path.start_with?('/admin'))
  end

  def movie
    @movie ||= Movie.find(movie_params)
  end

  def movie_params
    params[:movie_id] || params[:id]
  end

  def current_customer
    return @current_customer if @current_customer
    authenticate_customer!
    @current_customer
  end

  def authenticate_customer!
    token = request.headers["Authorization"]&.split(" ")&.last
    if token.present?
      begin
        decoded = Warden::JWTAuth::TokenDecoder.new.call(token)
        @current_customer = Customer.find(decoded["sub"])
      rescue => e
        render json: { error: "Unauthorized" }, status: :unauthorized and return
      end
    else
      return nil
    end
  end
end
