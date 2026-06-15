# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  before_action do
    Rails.logger.info "CURRENT CUSTOMER => #{current_customer.inspect}"
  end

  def create
    customer = Customer.find_by(
      email: params[:customer][:email]
    )

    if customer&.valid_password?(
      params[:customer][:password]
    )
      sign_in(customer)

      render json: {
        customer: {
          id: customer.id,
          email: customer.email
        }
      }
    else
      render json: {
        error: "Invalid email or password"
      }, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_customer)
    cookies.delete(:auth_token)
    render json: {
      message: "Logged out successfully"
    }
  end
end