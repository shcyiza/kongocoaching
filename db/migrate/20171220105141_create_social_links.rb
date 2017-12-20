class CreateSocialLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :social_links do |t|
      t.string :url
      t.references :social_medium, foreign_key: true
      t.string :socilizable_type
      t.integer :socializable_id

      t.timestamps
    end
  end
end
