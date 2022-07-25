class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save!
    SampleJob.set(wait: 30.seconds).perform_later(@message.id)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
