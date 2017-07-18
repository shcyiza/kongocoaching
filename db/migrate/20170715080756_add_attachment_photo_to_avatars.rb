class AddAttachmentPhotoToAvatars < ActiveRecord::Migration
  def self.up
    change_table :avatars do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :avatars, :photo
  end
end
