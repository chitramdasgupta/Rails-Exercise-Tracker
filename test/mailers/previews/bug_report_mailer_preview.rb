# Preview all emails at http://localhost:3000/rails/mailers/bug_report_mailer
class BugReportMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/bug_report_mailer/submit_bug_report
  def submit_bug_report
    BugReportMailer.submit_bug_report
  end

end
