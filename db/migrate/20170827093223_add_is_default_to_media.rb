class AddIsDefaultToMedia < ActiveRecord::Migration[5.0]
  def change
    add_column :video_links, :is_default, :boolean
    add_column :avatars, :is_default, :boolean
  end
end
