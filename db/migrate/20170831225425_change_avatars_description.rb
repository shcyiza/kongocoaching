class ChangeAvatarsDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :avatars, :description, :vignette
  end
end
