class MessageMailer < ApplicationMailer
  default from: 'from@example.com'

  def message_email(message, email)
    @message = message
    mail(to: email.to_s, subject: "#{message.body}を入力した", from: "推しだいありー(公式)")
  end
end
