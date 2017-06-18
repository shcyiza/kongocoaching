class AddAttachmentAvatarToTrainingTypes < ActiveRecord::Migration
  def self.up
    change_table :training_types do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :training_types, :avatar
  end
end
