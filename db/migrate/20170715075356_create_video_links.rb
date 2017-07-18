class CreateVideoLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :video_links do |t|
      t.string :video_path
      t.integer :filmable_id
      t.integer :filmable_type

      t.timestamps
    end
  end
end
