class AddReferrenceToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :user, foreign_key: true ,null: false
  end
end
