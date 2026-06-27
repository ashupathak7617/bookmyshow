class CustomersController < ApplicationController
  def current
    authenticate_customer!
    return if performed?

    if @current_customer
      render json: { customer: { id: @current_customer.id, email: @current_customer.email } }
    else
      render json: { customer: nil }
    end
  end
end
