class MessageMailer < ApplicationMailer
  default from: "from@example.com"

  def message_email(message, email)
    @message = message
    mail(to: "#{email}", subject: "#{message.body}を入力した")
  end
end
