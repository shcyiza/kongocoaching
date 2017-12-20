class CreateSocialMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :social_media do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
