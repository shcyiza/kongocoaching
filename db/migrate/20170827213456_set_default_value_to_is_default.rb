class SetDefaultValueToIsDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :video_links, :is_default, :boolean, default: false
    change_column :avatars, :is_default, :boolean, default: false
  end
end
