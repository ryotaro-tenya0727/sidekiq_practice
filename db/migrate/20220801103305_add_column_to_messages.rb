class AddColumnToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :executed_time, :datatime
  end
end
