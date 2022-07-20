class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
      sleep(1)
      Message.find_each do |message|
      message.update(sidekiq_executed_time: DateTime.current)
    end
  end
end
