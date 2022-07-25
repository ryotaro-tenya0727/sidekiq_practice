class SampleJob < ApplicationJob
  queue_as :mailers

  def perform(id)
    message = Message.find(id)
    MessageMailer.message_email(message)
  end
end
