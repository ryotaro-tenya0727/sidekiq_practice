class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :body
      t.datetime :sidekiq_executed_time
      t.timestamps
    end
  end
end
