class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  # MessageBroadcastJobを呼び出す
  belongs_to :user
  belongs_to :chat_group
  validates :body, presence: true
  mount_uploader :image, ImageUploader
end
