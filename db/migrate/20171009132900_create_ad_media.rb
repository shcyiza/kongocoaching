class CreateAdMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_media do |t|
      t.string :name
      t.references :ad_category, foreign_key: true

      t.timestamps
    end
  end
end
