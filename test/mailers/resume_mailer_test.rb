require 'test_helper'

class ResumeMailerTest < ActionMailer::TestCase
  test "resume_received" do
    mail = ResumeMailer.resume_received
    assert_equal "Resume received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
