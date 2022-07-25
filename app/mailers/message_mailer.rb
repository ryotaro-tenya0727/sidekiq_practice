class MessageMailer < ApplicationMailer
  default from: "from@example.com"

  def message_email(body)
    mail(to: "honi@su.com", subject: "#{body}を入力")
  end
end
