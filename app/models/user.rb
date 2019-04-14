class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments

  has_attached_file :avatar, styles: { medium: "5x5>", thumb: "5x5>" }, default_url: "/assets/original/male.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
