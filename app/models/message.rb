class Message < ApplicationRecord
  validates :text, :external_chat_id, :user_id, presence: true
  belongs_to :user
end
