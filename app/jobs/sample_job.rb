class SampleJob < ApplicationJob
  queue_as :honi

  def perform(*args)
      Message.find_each do |message|
      message.update(sidekiq_executed_time: DateTime.current)
    end
  end
end
