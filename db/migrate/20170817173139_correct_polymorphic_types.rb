class CorrectPolymorphicTypes < ActiveRecord::Migration[5.0]
  def up
    change_column :video_links, :watchable_type, :string
    change_column :avatars, :attachable_type, :string
  end

  def down
    change_column :video_links, :watchable_type, :integer
    change_column :avatars, :attachable_type, :integer
  end
end
