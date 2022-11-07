class Message < ApplicationRecord
  belongs_to :user
  # validates :body, inclusion: { in: %w(a b c), message: "無効なbody" }
end
