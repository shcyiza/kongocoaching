class ChangeFilmableToWatchable < ActiveRecord::Migration[5.0]
  def change
    rename_column :video_links, :filmable_id, :watchable_id
    rename_column :video_links, :filmable_type, :watchable_type
  end
end
