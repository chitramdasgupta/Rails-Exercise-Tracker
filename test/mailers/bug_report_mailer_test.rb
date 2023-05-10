require "test_helper"

class BugReportMailerTest < ActionMailer::TestCase
  test "submit_bug_report" do
    mail = BugReportMailer.submit_bug_report
    assert_equal "Submit bug report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
