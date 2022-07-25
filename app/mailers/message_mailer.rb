class MessageMailer < ApplicationMailer
  default from: "from@example.com"

  def message_email(message)
    @message = message
    mail(to: "honi@su.com", subject: "#{message.body}を入力した")
  end
end
