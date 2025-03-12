require "test_helper"

class SendMailMailerTest < ActionMailer::TestCase
  test "shows_details" do
    mail = SendMailMailer.shows_details
    assert_equal "Shows details", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
