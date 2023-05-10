class BugReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.bug_report_mailer.submit_bug_report.subject
  #
  def submit_bug_report(user, bug)
    @user = user
    @bug = bug
    mail to: 'admin@exercisetracker.com', subject: "A new bug report"
  end
end
