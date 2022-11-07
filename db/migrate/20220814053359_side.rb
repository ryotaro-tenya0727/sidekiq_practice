class Side < ActiveRecord::Migration[6.1]
  def change
    change_column_null :messages, :created_at, true
    change_column_null :messages, :updated_at, true
  end
end
