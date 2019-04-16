class AddAttachmentImageToTopics < ActiveRecord::Migration[5.2]
  def self.up
    change_table :topics do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :topics, :image
  end
end
