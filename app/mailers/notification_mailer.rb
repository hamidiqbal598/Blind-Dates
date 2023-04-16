class NotificationMailer < ApplicationMailer

  def new_notification(blind_date, employee, sender_employee)
    @greeting = blind_date
    # mail to: employee.email, subject: "Blind Date Created", from: sender_employee.email
    mail to: employee.email, subject: "Blind Date Created", from: "mailbutlertracker598@gmail.com"
  end
end
