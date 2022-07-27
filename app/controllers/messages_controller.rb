class MessagesController < ApplicationController
  before_action :require_login
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save!
    MessageMailer.message_email(@message, current_user.email).deliver_later(wait: 30.seconds)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
