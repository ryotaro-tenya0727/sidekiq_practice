class MessagesController < ApplicationController
  before_action :require_login
  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.save!
    # MessageMailer.message_email(@message, current_user.email).deliver_later(wait: 30.seconds)
    SampleJob.set(wait_until: Time.zone.parse(message_params[:executed_time])).perform_later(@message.id)
  end

  private

  def message_params
    params.require(:message).permit(:body, :executed_time)
  end
end
