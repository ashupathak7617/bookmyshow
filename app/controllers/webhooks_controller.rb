class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    payload    = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']

    event = Stripe::Webhook.construct_event(
      payload, sig_header, "whsec_54b8144b71fed732aafc35513d90642e1e3c49589dcee349d498370a815b18c1"
    )

    if event.type == 'checkout.session.completed'
      stripe_session = event.data.object
      booking_id = stripe_session.metadata['booking_id']

      if booking_id.present?
        booking = Booking.find(booking_id)
        booking.update!(status: 'confirmed')

        BookingMailer.confirmation_email(booking).deliver_later
      end
    end

    render json: { received: true }

  rescue Stripe::SignatureVerificationError
    render json: { error: 'Invalid signature' }, status: :bad_request
  end
end