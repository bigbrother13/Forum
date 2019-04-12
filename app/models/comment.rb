class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :comment, presence: true
end
