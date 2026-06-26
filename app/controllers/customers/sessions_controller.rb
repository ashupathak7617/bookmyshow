class Customers::SessionsController < ApplicationController

  def create
    customer = Customer.find_by(email: params[:customer][:email])
    if customer&.valid_password?(params[:customer][:password])
      token = Warden::JWTAuth::UserEncoder.new.call(
        customer, :customer, nil
      ).first

      render json: {
        customer: {
          id: customer.id,
          email: customer.email
        },
        token: token
      }
    else
      render json: {
        error: "Invalid email or password"
      }, status: :unauthorized
    end
  end

  def destroy
    token = request.headers['Authorization']&.split(' ')&.last
    render json: { message: "Logged out successfully" }
  end
end