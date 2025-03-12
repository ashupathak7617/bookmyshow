require 'sidekiq'

class SendMailShowInfoJob

  include Sidekiq::Job
  def perform
    today_shows = Show.where("created_at >= ?", Time.zone.now.beginning_of_day)
    cust = Customer.all
    cust.each do |customer|
     ShowsMailer.shows_detals(customer, today_shows).deliver

    end
  end
end
