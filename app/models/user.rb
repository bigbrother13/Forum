class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :topics
  has_many :comments

  # has_attached_file :user_image, styles: { medium: "30x30>", thumd: "30x30>" }
  # validates_attachment_content_type :user_image, content_type: /\Aimage\/.*\Z/


end
