class Topic < ApplicationRecord
  belongs_to :user
  has_many   :comments

  scope :actual, ->{ order(created_at: :desc) }

  has_attached_file :image, styles: { medium: '200x200>', thumb: '200x200>' },
                            default_url: "/assets/original/male.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
