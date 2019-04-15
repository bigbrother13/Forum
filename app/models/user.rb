class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :topics
  has_many :comments

  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "200x200>" }, default_url: "/assets/original/male.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
