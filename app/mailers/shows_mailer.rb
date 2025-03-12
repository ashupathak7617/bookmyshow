class ShowsMailer < ApplicationMailer
  
  default from: "from@example.com"
  
  def shows_detals(customer, today_shows)
    @greeting = "Hi"
    @customer = customer
    @shows = today_shows
    mail(to: @customer.email, subject: 'New Movie shows are available')
  end
end
