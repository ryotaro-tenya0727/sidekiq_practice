class MessageMailer < ApplicationMailer
  default from: email_address_with_name('oshi-diary@example.com', '推しダイアリー（公式）')

  def message_email(message, email)
    @message = message
    mail(to: email.to_s, subject: "#{message.body}を入力した")
  end
end
