class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.integer :attachable_id
      t.integer :attachable_type

      t.timestamps
    end
  end
end
