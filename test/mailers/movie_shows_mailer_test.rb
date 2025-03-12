require "test_helper"

class MovieShowsMailerTest < ActionMailer::TestCase
  test "show_deatils" do
    mail = MovieShowsMailer.show_deatils
    assert_equal "Show deatils", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
