class AddAvatarToUsersAndToTraningType < ActiveRecord::Migration[5.0]
  def change
    def up
      add_attachment :users, :avatar
      add_attachment :training_types, :avatar
    end

    def down
      remove_attachment :users, :avatar
      remove_attachment :training_types, :avatar
    end
  end
end
