class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    message = Message.find(args[0])
    email = message.user.email
    MessageMailer.message_email(message, email).deliver_later
  end
end
