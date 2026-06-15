class CustomersController < ApplicationController
  def current
    if current_customer
      render json: {
        customer: {
          id: current_customer.id,
          email: current_customer.email
        }
      }
    else
      render json: { customer: nil }
    end
  end
end