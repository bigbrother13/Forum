class Topic < ApplicationRecord
  belongs_to :user
  has_many   :comments

  scope :actual, ->  { order(:created_at => :desc) }
end
