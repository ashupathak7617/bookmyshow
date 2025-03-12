# Preview all emails at http://localhost:3000/rails/mailers/send_mail_mailer
class SendMailMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/send_mail_mailer/shows_details
  def shows_details
    SendMailMailer.shows_details
  end
end
