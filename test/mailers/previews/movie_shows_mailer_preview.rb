# Preview all emails at http://localhost:3000/rails/mailers/movie_shows_mailer
class MovieShowsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/movie_shows_mailer/show_deatils
  def show_deatils
    MovieShowsMailer.show_deatils
  end
end
