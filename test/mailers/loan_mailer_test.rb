require 'test_helper'

class LoanMailerTest < ActionMailer::TestCase
  test "send_copy_to_email" do
    mail = LoanMailer.send_copy_to_email
    assert_equal "Send copy to email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
