class AddDescriptionToAvatars < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :description, :string
  end
end
