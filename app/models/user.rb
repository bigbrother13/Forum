class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :topics
  has_many :comments

  validates :user, presence: true

  # mount_uploader :avatar, AvatarUploader
end
